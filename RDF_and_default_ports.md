# On representing HTTP port numbers in RDF

Erich Bremer has described a really neat idea for representing system logs as linked data, noting in particular the potential for better diagnosis of problems involving multiple log-generating components.

Details are [here](http://www.ebremer.com/paladin/pipelogger/2013-04-08)

It's a fine proposal, but I have a nit with a way he proposes one might use RDF:

> Some of these elements may not be so interesting like "port" if port 80 is the only one being listened on.  The lines can be removed to reduce the number of triples per log event.

As stated, if it's simply a case that the port number is "uninteresting", then this would be fine.  But concern, reinforced somewhat by a [twitter conversation with Erich](ttps://twitter.com/erichbremer/status/339427207799771137]), is that the absence of a port number in the log might be taken to mean that the port number used _is_ 80 for http: (or 443 for https:).

This is fine for the HTTP protocol, which does indeed specify that the _default_ port to use is 80 (or 443) if none is explicitly specified in a request.

But RDF semantics are built on an open world model, which means that you cannot infer any fact from the absence of information: at any time, one may have a partial view of all available information.

This means (for any RDF expressions A, B and C):

   if  A |= C  then  A + B |= C

That is, if expression A entails C, then A together with some other information B also entails C.  This is expressed in the RDF semantics specification:

> Given a set of RDF graphs, there are various ways in which one can 'add' information to it. Any of the graphs may have some triples added to it; the set of graphs may be extended by extra graphs; or the vocabulary of the graph may be interpreted relative to a stronger notion of vocabulary entailment, i.e. with a larger set of semantic conditions understood to be imposed on the interpretations. All of these can be thought of as an addition of information, and may make more entailments hold than held before the change. All of these additions are monotonic, in the sense that entailments which hold before the addition of information, also hold after it.

-- [http://www.w3.org/TR/rdf-mt/#MonSemExt](http://www.w3.org/TR/rdf-mt/#MonSemExt)

Consider then the following RDF statements (excerpted from [Erich's post](http://www.ebremer.com/paladin/pipelogger/2013-04-08]):

    _:req a http:Request;
      http:httpVersion "HTTP/1.1";
      http:methodName "GET".

Is it OK to infer this?:

    _:req a http:Request;
      http:httpVersion "HTTP/1.1";
      http:methodName "GET";
      :port 80 .

I would say it is not OK, as we might later be presented with an additional RDF statement:

    _:req :port 8080 .

If we had previously inferred use of port 80, that inference would now be incorrect - this kind of repudiation of valid inferences valid by adding additional information to a premise is exactly the kind of "non-monotonicity" that RDF semantics does not allow.  A diagnostic process analyzing multiple log files may have recommended a recovery process based in part on the presented port number.  Monotonic reasoning allows such a recommendation to be made safe in the knowledge that additional (correct) information will not invalidate it.

Is this a problem for the log file representation scheme proposed?

I would say not: by explicitly indicating a port number if it is known, regardless of whether it was explicitly specified in the request URI, all these concerns can be avoided.  Or use some other mechanism that explicitly states the port number is default, such as:

    _:req a http:Request;
      http:httpVersion "HTTP/1.1";
      http:methodName "GET" ;
      :portDefault "True" .

This way, it may be known that an explicit port number statement cannot validly be added later.


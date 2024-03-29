# Qualified properties

- _Graham Klyne, 2018-03-07 working notes_

Qualified properties is the term I'm using to describe relationships between entities that are additionally qualified or otherwise contextualized; e.g. role of participation in activity, or duration of a relationship.

# Approaches

Note that there is a fair degree of overlap between the different approaches referenced here; e.g. PROV qualified associations might be viewed as a special case of reification.

Many of the approaches involve what I call "reificaton of the relation", which is creating a new resource type to represent relationships between entities, instances of which represent specific instances of that relationship.  By being a resource, it is possible to add additional statements that are specific to a particular use or instance of the relation.  (For comparison, in RDF, a property URI refers to *all* uses of the denoted relation, in the same way that a class URI refers to all instances of that class.)

## Subproperties

For example, to capture the role of a musician in a performance, use a specific subproperty of "performs in"; e.g. "plays guitar in".

There are two drawbacks:

1. limited addiitonal information can be associated in this way; it's not so easy to associate, say, a time peridod with a relationship between places.

2. harder for OWL inference.  In particular, when there is an open-ended set of possible properties, efficient class-based reasoning based on OWL-QL is lo longer available.

See also: singleton properties (below).


## RDF reification

- http://www.w3.org/TR/rdf-primer/#reification

This approach re-appears in other options below, but the built-in RDF reificaton vocabulary is very weak in that it has no asscoaited semantics (due to there being deployed systems with divergent intent at the time the RDF semantics were first standardized).

## Named graphs

- http://www.w3.org/TR/rdf11-primer/#section-multiple-graphs

Statements may be collected in a named graph, allowing other statements that make claims about the graph.  Depending on the semantics of the properties used, these may qualify semantics of the statements in the graph.

Basic RDF does not define any specific semantics for named graphs, so any use for inference would require building suitable semantiucs from the ground up (respecting, or course, normal RDF semantics).  There were some proposals for named graph semantic frameworks, but none of these were considered suitable for standardization:

- http://www.w3.org/TR/rdf11-datasets/

## New class N-ary RDF relations

- http://www.w3.org/TR/swbp-n-aryRelations/#pattern1

This approach is similar in some ways to RDF reification, but the new terms introduced are more specific to a particular situation.  These new terms can have associated semantics within the overall RDF semantic model.

Using this approach can impact complexity and maintainability of model and data. See:

- http://www.w3.org/TR/swbp-n-aryRelations/#choosingPattern1or2

## PROV qualified associations

- http://www.w3.org/TR/prov-o/#description-qualified-terms

This is a particular instance of the previous pattern ("New class N-ary RDF relations"), where a number of new classesd and relations are introduced to allow, among other things, roles in activities to be associated with a `prov:qualifiedAssociation`.

- http://www.w3.org/TR/prov-o/#qualifiedAssociation

## Singleton properties

This is a rather different approach to the above options that alows the introduction of a new URI for a specific use of a property, and thereby allows additional informnation to be associated with that use.  It's an interesting approach, but as far as I know it is not widely used in practice.

- "Don’t Like RDF Reification? Making Statements about Statements Using Singleton Property",Vinh Nguyen, Olivier Bodenreider, and Amit Sheth
- https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4350149/
- https://www.ncbi.nlm.nih.gov/pubmed/25750938/
- https://doi.org/10.1145/2566486.2567973

## CIDOC CRM "dot-one" properties

The CIDOC CRM community has noted similar issues with recording roles in activities and similar matters, and have come up with their own proposals that are similar to the RDF "reification of relation" approaches described above.

- http://www.cidoc-crm.org/roles-in-the-cidoc‐crm-modelling-properties-of-properties
- http://www.cidoc-crm.org/lrmoo/sites/default/files/Roles.pdf
- http://www.cidoc-crm.org/sites/default/files/20160802PropertiesOfProperties.pptx

At the current time, it does not appear to have made its way into the formal CIDOC CRM spec, but is mentioned in some documents, such as the CIDOC CRM online documentation and Erlangen OWL implemenation

- http://www.cidoc-crm.org/Version/version-6.2.3 (e.g. description of E7 Activity)
- http://www.cidoc-crm.org/Property/p14-carried-out-by/version-6.1
- http://erlangen-crm.org/docs/ecrm/091125/objectproperties/P14.carried_out_by___1817958994.html (mentions )

## Specialized object resources

Rather than reifying the property itself, the object could be repkaced by a new node that is a specialization of the intended object.  Additional qualifications could be addec to the sepcialized obvject resource.

NOTE: this possible pattern is not, to my knowledge, documented anywhere.  It occured to me while reviewing [`when` clause in `part-of` relation ](https://github.com/LinkedPasts/lp-network/issues/1#issuecomment-372062162), and considering that in place of:

    { "@id": "myplace:Oxford",
       "part_of": [
            { "@id": "myplace:Oxfordshire",
              "when": {"timespans": [["1000","","","2018",""]]}
            }
        ]
    }

one might write:

    { "@id": "myplace:Oxford",
       "part_of": [
            { "prov:specializationOf": "myplace:Oxfordshire",
              "when": {"timespans": [["1000","","","2018",""]]}
            }
        ]
    }

See PROV [specializationOf property](http://www.w3.org/TR/prov-o/#specializationOf).


## Bio CRM

See:
- https://seco.cs.aalto.fi/publications/2018/tuominen-et-al-bio-crm-2018.pdf

"Bio CRM extends CIDOC CRM by introducing role-centric modeling."

Viewing the figure 1 in this paper, I conclude that BIO CRM uses a form of specialized object resource (see above) for capturing role information.  This is supported by the subsequent discussion.  The property `bioc:inheres_in` could be seen as a subproperty of `prov:specializationOf`

The paper suggests the formal description is at http://ldf.fi/schema/bioc/, but I could not retrieve that URL (as of 2019-06-19).  "The namespace of the Bio CRM schema is [http://ldf.fi/schema/bioc/](http://ldf.fi/schema/bioc/), here used with the prefix `bioc`. The full specification of Bio CRM (class and property listing) is available in the namespace URI."

A different paper on Bio CRM:
- https://seco.cs.aalto.fi/projects/biographies/biocrm-2016-08-19.pdf

This describes `bioc:Actor_role` as the root of a hierarchy of "classes for representing people in roles for personal relations", which also implies the specialization model.  Examples in this paper are consistent with this interpretation.


## Web Annotations

Can [Web Annotations](https://www.w3.org/blog/news/archives/6156) serve a riole similar to reified properties?  An annotation acts as a kind or relation between a "target" and a "body" (which may be desigated as URIs), but also carries additional information (e.g. PROV-like who, when).

@@TODO: Needs more investigation.

See also:

- https://www.w3.org/TR/2017/REC-annotation-model-20170223/
- https://www.w3.org/TR/2017/REC-annotation-vocab-20170223/
- https://www.w3.org/TR/2017/REC-annotation-protocol-20170223/


## RDF\* and SPARQL\*

I haven't reviewed these mechanisms, but am including them here for reference.  Being a non-standard extension to RDF, it's probably not a viable choice for practical use at this time (early 2018).

"The idea of RDF* is to extend RDF with the possibility to 
have triples as the subject or the object of other triples (i.e., nested 
triples)" -- https://lists.w3.org/Archives/Public/semantic-web/2018Apr/0030.html

[1] Olaf Hartig and Bryan Thompson: Foundations of an Alternative Approach to 
Reification in RDF. In CoRR abs/1406.3399, 2014.  http://arxiv.org/pdf/1406.3399

[2] Olaf Hartig: Reconciliation of RDF* and Property Graphs. In CoRR abs/
1409.3288, 2014. http://arxiv.org/pdf/1409.3288

[3] Olaf Hartig: Foundations of RDF* and SPARQL* - An Alternative Approach to 
Statement-Level Metadata in RDF. In Proceedings of the 11th Alberto Mendelzon 
International Workshop on Foundations of Data Management (AMW), 2017. http://olafhartig.de/files/Hartig_AMW2017_RDFStar.pdf


## Encode triple as URI

@@NOTE: this is just a rough idea, not really worked out, recorded here for later review.

This might be a variation of RDF\*.  e.g.

    http://rdfstatement.example.org/subjuri/propuri/objuri

or

    http://rdfstatement.example.org?s=subjuri&p=propuri&o=objuri

with appropriate %-encoding applied.  A disadvantage of this approach is that it wouldn't apply so easily to statements containing literals without some more thought.

@@NOTE: also need to consider how to handle embedded URIs that are themselves statement URIs - is double %-escaping required?

A variation might be to use a data: URI, such as

    data:application/n-triples,<suburi> <propuri> <objuri> .

again with %-encoding applied as needed.  

These approaches might offer a way to capture advantages of the RDF\* approach using standard RDF store software.


## Other links

- http://patterns.dataincubator.org/book/
- http://patterns.dataincubator.org/book/qualified-relation.html
- http://www.w3.org/TR/n-triples/
- https://tools.ietf.org/html/rfc2397

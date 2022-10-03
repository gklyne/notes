# Is there is any problem having a slash after a hash in RDF URIs?

This note embodies my thoughts inresponse to a question about '/' characters in the fragment part of URI-references in RDF data.

For context, the orginal question:

> Do you know if there is any problem having a slash after a hash in URIs?
>
> E.g. http://oxlod.oerc.ox.ac.uk/catalog/manuscript#item/title
>
> It might be difficult for the web server to serve content at that address, but from purely the suitability of identifier's point of view, does it matter? 

I thought this was going to be an easy question, but it turns out to be not-so-straightforward...

_TL;DR:_ In RDF data it may be safest to stick with URI fragments conforming to `NCName` as defined by the [XML namespace spec][9].

## Longer exploration:

According to RFC3986, '/'' is specifically allowed in fragments [(RFC 3986, section 3.5)][1].

[1]: https://tools.ietf.org/html/rfc3986#section-3.5

The web server should never see the fragment: for retrieval purposes it is separated from the rest of the URI and not sent to the server; the client is expected to handle it based on the media type of the representation returned.

Conformant URI handlers _should_ handle fragments separately for URI resolution purposes, so there _should_ be no problem here [(RFC 3986, section 5.2)][2].

[2]: https://tools.ietf.org/html/rfc3986#section-5.2

A potential wrinkle I see is that non-conformant URI resolver software could fail to separate the fragment from the rest of the URI path before performing reference resolution, which could lead to incorrect results.  I don't know of any software that fails in this way, and I wouldn't personally consider this a problem with '/' in fragments.  I believe some MIME types explicitly use '/' in their fragment syntax.

The bigger issue, I think, is that the meaning of the fragment is defined by the media type of the referenced resource representation, not by the application (see [RFC 3986][1]).  If you don't know the representation media type of the resource (as identified by the URI without the fragment identifier), then using specific fragment syntax may break in other ways.  If you are simply minting identifiers for use with RDF, I would suggest sticking with the [fragment syntax indicatedfor RDF/XML][3] (defined by reference to [RFC 3023, section 5][4]), or [Turtle][5] (which appears to be unspecified), or [JSON-LD][6] (which defers to [RDF Concepts][7], which in turn effectively defers to the particular representation used).

[3]: http://www.w3.org/TR/rdf-syntax-grammar/#bib-RFC3023

[4]: https://tools.ietf.org/html/rfc3023#section-5

[5]: http://www.w3.org/TR/turtle/#sec-mediaReg

[6]: http://www.w3.org/TR/json-ld/#iana-considerations

[7]: http://www.w3.org/TR/rdf11-concepts/#section-fragID

The upshot is that fragment syntax is not well defined for URIs used in RDF.  Historically, due to the way [RDF/XML defines fragment identifiers][8], fragments are commonly restricted to the syntax available for `id` attributes in XML/HTML as [`NCName` values][9].

[8]: http://www.w3.org/TR/rdf-syntax-grammar/#rdf-id

[9]: http://www.w3.org/TR/REC-xml-names/#NT-NCName

So the upshot is: In RDF data, absent some specific known media type referenced by the URI, it may be safest to stick with URI fragments conforming to `NCName` as defined by the [XML namespace spec][9]


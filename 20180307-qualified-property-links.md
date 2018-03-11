# Qualified properties

- _Graham Klyne, 2018-03-07 working notes_

Qualified properties is the term I'm using to describe relationships between entities that are additionally qualified or otherwise contextualized; e.g. role of participation in activity, or duration of a relationship.

# Approaches

Note that there is a fair degree of overlap between the different approaches referenced here; e.g. PROV qualified associations might be viewed as a special case of reification.

Many of the approaches involve what I call "reificaton of the relation", which is creating a new resource type to represent relationships between entities, instances of which represent specific instances of that relationship.  By being a resource, it is possible to add additional statements that are specific to a particular use or instance of the relation.  (For comparison, in RDF, a property URI refers to *all* uses of the denoted relation, in the same way that a class URI refers to all instances of that class.)

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


## Other links

- http://patterns.dataincubator.org/book/
- http://patterns.dataincubator.org/book/qualified-relation.html


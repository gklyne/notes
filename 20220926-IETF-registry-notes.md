# 20220926-IETF-registry-notes.md


## Discussion agenda

Reviewer succession planning

Provisional FCFS issues

- P1: schemes not meeting formal requirements (e.g., syntax)
- P2, P8: schemes passing standards-track last call with inadequate review
- P3: Inaccessible or incomplete documentation
- P4: Should there be a "specification required" for provisional registrations?
- P5: What form should the specification take?
- P6: What are acceptable formats for providing the registration template?
- P7: Bogus registration requests

Permanent scheme registration

- S1, S2: how to judge "utility" (as part of "Demonstrable, New, Long-Lived Utility"?
- S3: Non-IETF-stream RFC publication
- S4, S6: Adequacy of documentation
- S5: The registration procedure isn't clear about the need for consensus
- S7: Ppersistent registration attempts
- S8: Change control for permanent registrations

Other issues encountered

- O1: binary data in URIs
- O2: IESG approval of standards status without prior review of URI schemes
- O3: Removing registry entries


## Introduction

These notes are intended to serve to:

1. Raise for discussion some issues that I have noticed over 20 years(!) of reviewing URI scheme registrations (and, to a lesser extent, message header registrations)

2. Suggest some tweaks to the registration process (maybe involving updates to the registration document.)

3. Provide some notes that may help to facilitate handover to a new designated reviewer

4. Initiate a discussion about succession planning for the URI scheme  and message header registration IANA designated reviewer role.


## Background

I have been acting as IANA's designated reviewer for URI scheme and message header registrations since the registries were initially introduced, a period of over 20 years.  During this time, there have been a number of issues arisen that have been resolved on an ad hoc basis.  In preparing these notes,  I have reviewed my email archive for URI scheme registrations, and made notes about issues that I have noted - this note attempts to condense recurring themes from those discussions, and make some suggestions as a basis of discussion about possible changes to the process.



## FCFS provisional registration of URI schemes

The URI scheme registry was originally proposed in about 2006 [RFC4395].  It introduced for URI schemes a notion of provisional and permanent registration of URI schemes, an structure that had been previously adopted for message headers [RFC3864].  Registration procedures for both permanent and provisional schemes required "Expert review", and required quite a lot of technical detail to be provided in the registration template, which would often duplicate the scheme's technical specification.

In 2015, in response to criticisms from scheme implementers that the registration process was too heavyweight, and time-consuming to complete, the URI scheme registration procedure was updated [RFC7595]with two major changes:

1. A simplified registration template, on the assumption that relevant technical details would be contained in a separate specification document, and

2. Changing provisional registration to "first come, first served" (FCFS), to speed up the process of provisional registration by dropping the need for expert review.

The requirements for permanent registration, which are normatively citable by internet standards, were and remain quite high.  As scheme registration reviewer, I supported and support these changes, but note some consequences that have cropped up in their operation: 

- P1: The lack of review means that provisional schemes can be registered that do not meet the formal requirements (notably syntactic compatibility) of all URI schemes.  There are similarly other normative requirements (SHOULDs) in RFC7595 for which there is no procedure to confirm satisfaction (e.g. "SHOULD include clear security considerations", "... differences and reasons SHOULD be noted").

- P2: Schemes, particularly from IETF/IRTF working groups, can advance to the point of requesting permanent registration late in the development without visibility to the wider URI-interested community.  This happens particularly when the provisional registration has happened without review on the designated URI-review@ietf.org mailing list (such review is recommended, but not required).  Working groups are advised to submit early permanent registration requests to prompt review, but this doesn't always happen in practice.

- P3: Inaccessible or incomplete documentation.  Related to the previous point, this is mainly problematic when the developers request advancing a scheme to a permanent registration; for example, this has recently been an issue with an ISO-originated proposal.

- P4: Should there be a "specification required" for provisional registrations?  RFC7595 is contradictory on this: it is implicitly required "The scheme definition SHOULD include ..." (section 4); yet elsewhere "A scheme specification is only required for 'permanent' registration." (section 7).

- P5: If required, what form should the specification take?  Ideally the specification would be publicly accessible.  It would be counter to the intent of provisional registration to expect such specification to be fully detailed, but it's hard to imagine a meaningful registration that doesn't refer to a description of what purpose the URI scheme is intended to serve, and an outline design including a draft syntax specification.  (This information would previously have been found in the registration template itself.)

- P6: What are acceptable formats for providing the registration template?  If the template is to be published by IANA it needs to be in a text format.  But is it OK to provide a link to a non-text document (HTML, PDF, Word, other proprietary format?).  If published as an Internet Draft or an RFC, then there is no problem.  As reviewer, my test has been, roughly, "can I just click on the link and see the template"?   HTML would pass this test, but I regard PDF as borderline here, and other formats likely to be rejected.  But provisional schemes can be registered without review, so is there a clear requirement we can state that IANA can easily check?

- P7: Bogus registration requests:  there has been a case of an attempted bogus provisional registration that simply cited the charter of a defunct working group.  Fortunately, IANA noticed this and asked me anyway, even though review was not required, and I was able to suggest an arguable reason to refuse registration that fell within IANA's checking remit.  This was not challenged but, if it was, the argument would have been easier to sustain if there was an explicit requirement for a specification.  I think this would also make it easier for IANA to spot problems.

- P8: Problematic requests proposed by IETF working groups without specific URI expertise.


In hindsight, I think the move to FCFS has probably caused more work than it has saved, by allowing issues to remain un-noticed until a request for permanent registration arrives later in the day.


## Permanent scheme registration

- S1: how to judge "utility" (as part of "Demonstrable, New, Long-Lived Utility"?  RFC7595 (and, by reference, RFC5226) is not explicit about this: it is rather left to the reviewer's judgement (other than to say that the reviewer should not override IETF consensus (sect 7.1).  To date, all approved requests for permanent registration have been based on IETF-stream RFC documents, which carry implicit consensus by virtue of an IETF last-call.  My guidelines for assessing this are (a) "IETF review" [RFCX5226], (b) equivalent review in a recognized open standards organization [RFC2026, section 7], (c) multiple implementations with a public specification, or (d) widespread use and/or deployment.

    - IANA maintains a list of recognized open standards bodies for purposes of MIME registration, which I refer to (https://www.iana.org/assignments/iesg-recognized-organizations/iesg-recognized-organizations.xhtml)

    - "widespread use" is commonly judged by an online search for the requested URI scheme.

    - see also email from Larry Masinter of 2010-01-29 about "widgets".  (http://www.w3.org/mid/C68CB012D9182D408CED7B884F441D4D5FEC60@nambxv01a.corp.adobe.com)

- S2: Other concerns for showing "Demonstrable, New, Long-Lived Utility".  New would mean showing that existing schemes do not provide the required capabilities.  "Long-lived" would mean 2 things: (a) that the specification is stable and will continue to be accessible, and (b) that the described use is not dependent on some transient aspect of the Internet or WWW.

- S3: RFC7595 discusses updating scheme status on "publication as an RFC" (sect 7.4).  I understand this was drafted before the RFC ISE stream was established, which does not require IETF review.  I tend to query registration requests that come via ISE stream, requesting more evidence of widespread review.  To some extent, this is ameliorated by an IESG conflict review, but this does not always cover URI-scheme concerns.  (Similar concerns can arise with IRTF-stream requests, but here there's usually some clearer sense of community consensus.)

- S4: Adequacy of documentation. There used to be a requirement for a "permanent stable reference", with an implication that it should be publicly accessible, but this wording is not present in RFC7595.  I tend to apply this requirement for permanent registrations, unless there are other compelling reasons to allow them.  I see a problem if the specification is published in some private space that may go away, or may be updated to be non-conformant without updating the registration.  This could represent a way to create an effective "standard" that violates community-agreed requirements.

- S5: The registration procedure isn't clear about the need for consensus. I regard this is being implied by the discussion of "Demonstrable, New, Long-Lived Utility" (section 3.1).  I've seen cases where a new permanent scheme is being pushed by one person without any obvious community of support, and will usually resist.  But there isn't always a clear justification for doing so.  (See also 2014-07-09 discussion of new URI reg.)  In some cases the desire for clear consensus is trumped by evidence of widespread deployment.

- S6: It has been agreed with IANA that permanent registration requests in an Internet Draft will be entered as provisional until the draft is approved for RFC publication (discussion about 2021-09-03).

- S7: There are occasionally persistent attempts by individuals to push a new registration request without reasonable attempt to respond to community feedback, or attempt to make a minimal response and suggest that is enough.

- S8: Change control for permanent registrations - could a permanent registration be unilaterally changed by a player acting in bad faith?  RFC4395 is unclear for specifications that are not defined in IETF documents.  Should there be any change control restrictions for permanent registrations?


## Other notes

- O1: binary data in URIs (cf. swid: scheme)

    > I'm concerned about the case that the tag is a binary string.  The %-encoding mechanism of RC3986 is generally used for mapping extended character sets into US-ASCII, and I'm not aware of any case where it is used to directly encode binary data.  In particular, it's not clear to me how this should be handled during attempted dereferencing (RFC3986 section 2.4) - the application of %-decoding described there would result in binary data which might be problematic for subsequent generic URI processing code.  URIs are defined to be character strings that are encoded as octets for transmission (RFC3986, section 2).  Other URI schemes used to convey arbitrary data (the 'data:' scheme springs to mind, ni: is another example) generally use a defined encoding such as 'base64' to yield a character string, before the URI is considered for %-encoding.  I think this aspect of the swid: URI scheme should be subjected to review by other experts in this area.

    I'm inclined to request discussion on URI-review.

- O2: IESG approval of standards status without prior review of URI schemes.  Is there a procedural fix for this?  Maybe this goes back to the problems noted above of FCFS provisional registration.

- O3: Removing registry entries.  Should this be possible, or use "tombstone" entries.




## Suggestions

(If possible, tweak the internal procedures, or provide additional guidance, rather than actually change the registration procedure.)

### P1, P2, P3, P8 (lack of early review, incomplete documentation)

Possible remedies

1. Revert to "Expert review", with the explicit intention that the expert should allow provisional registration unless the scheme is clearly bogus or ill-conceived.

2. Instruct IANA to post notice of provisional registrations (or all new registrations) to the URI-review list

### P4 ("specification required" for provisional registrations?)

Can this be clarified with an erratum:  a public specification is RECOMMENDED for provisional registrations, and REQUIRED for permanent registrations.

### P5 (form of specification)

Discuss in some associated guidance notes of checklist?  E.g. something like the HTTP message header field registry (https://github.com/protocol-registries/http-fields#suitable-specification-documents).

### P6 (format of template)

Suggest in guidance notes that the template should be available as plain text (or HTML?).  Contained in a plain text document such as an RFC is fine, but if the specification document is (say) PDF, then also supply a plain text version (with document reference) that can be added to the registry data.

### P7 (Bogus registration requests)

Early review (see P1) would help catch these.  Also, some basic requirements such as requiring a clear statement of purpose and/or meaningful references in the template.

### S1, S2, S5 (How to judge "Demonstrable, New, Long-Lived Utility", community consensus required?)

I suspect the harm caused by unused (but otherwise competent) scheme registrations may be overstated in RFC 7595 - implementation is the real touchstone here, and an unimplemented scheme registration is mostly noise.  I think this could be covered in guidance notes rather than any procedural change.

### S3 (ISE stream RFCs)

Add an erratum to mention IETF-stream RFCs rather than just "publication as an RFC" .  The intent here is not to prevent permanent registration, but to recognise that ISE-streams have not automatically received IETF review.

### S4 (Adequacy of documentation)

What forms of non-IETF RFC publication are acceptable?  Discussion needed, and something to put in guidance notes?  See also P5.

The template description states: "A scheme specification is only required for 'permanent' registration.", but this requirement for a specification doesn't appear to be covered elsewhere in the registration procedure.  I generally assume it as a requirement, but I'd like to see it more clearly stated, e.g. as part of what constitutes "Well Defined".  Also, make reference to there being a publicly accessible scheme definition (per section 2) in section 7.2?

### S8 (Change control for permanent registrations)

Consider that all change control for any permanent registration is assigned to IETF or a recognized open standards organization?  Or just add an "IESG note" to requests without clear community change control?


### O1 (binary in URIs)

Seek to clarify this.  Add to guidance notes.

### O2 (URI scheme review for standards-track documents)

Is there any way to trigger an expert review when a last-call happens for a standards track document with URI registration?  Or maybe remedies for P1 are enough?

### O3 (Removal of entries)

Either:

1. Clarify that entries cannot be removed (but may be "tombstoned"), or

2. Add procedure for removal of an entry




@@@ 2. FCFS for provisional registrations "All this suggests to me there may be a process issue with URI scheme registration, now that provisional registrations are not reviewed. I’m not sure that there’s an easy fix, but it would have been helpful if I’d had a chance to raise discussion on URI-review before the document gained IESG approval for publication." 2022-08-02 (coswid)
@@@ suggest?:
"""
NOTE: although presenting for review at URI-review@ietf.org is not a requirement for provisional registration, failure to do so may lead to problems with any subsequent request for permanent registration.
"""
@@@ or:
"""
When adding or a provisional URI scheme, IANA sends an announcement email to URI-review@ietf.org.  If there is feedback that the scheme registration is invalid, the designated expert may request removal of the provisional registration. 
"""









@@@ suggest: IANA-checkable specification required for provisional registration @@@.)

@@@ also suggest: public checklist for all registrations? @@@

@@@ 10. Checklist for reviewers? (cf emails with Larry ~ 2007-07-20)

@@@ DE maybe provide holding response, and directly request feedback on URI-review list?  (Suggested by RFC5226)





## Reviewer succession planning

@@@ reviewer succession planning (see also 2013-09-09!)


Suggest appointing a new reviewer with whom I can work for a period of time (e.g. a year).

Also, an updatable checklist should make it easier for a new reviewer to pick up and apply the process, without eliminating the role of informed judgement.












## Raw notes

(Dates refer to email messages, many on the IANA parameter registration lists, but some may be personal communications.  These raw notes should be treated as private communications, as I don't want this to become a finger-pointing exercise.)


Issues

1. Permanent registration via ISE RFC (avoids IETF review).  Also mention of IRTF stream about 2013-10-15.  Again: 2019-01-10.
2. FCFS for provisional registrations "All this suggests to me there may be a process issue with URI scheme
registration, now that provisional registrations are not reviewed. I’m not sure that there’s an easy fix, but it would have been helpful if I’d had a chance to raise discussion on URI-review before the document gained IESG approval for publication." 2022-08-02 (coswid)
3. adequacy of documentation for permanent registrations (used to be "permanent stable reference" - still so for URIs?)  See Lisa email 2010-02-17.   Also 2010-06-30.,  Also 2022-08-02.
4. clarity about need for consensus (cf. recent drop: permanent registration request), particularly with registration requests from individuals.   See also 2014-07-09 discussion of new URI reg.
5. with URIs, FCFS allocation for provisional schemes means that often I'm unaware of new schemes until permanent registration is requested.   Suggest: IANA send announcement to URI-review when making a provisional (or any) registration?
6. reviewer succession planning (see also 2013-09-09!)
7. Change control for permanent registrations - could a permanent registration be unilaterally changed by a player acting in bad faith?  RFC4395 is unclear for specifications that are not defined in IETF documents.
8. Effect of “DoS” by persistent attempts at registration without properly responding to community feedback.
9. URI scheme standards track RFC?  (cf 2007-02-17)  Also Tony Hansen 2007-02-19, and my response.  Relates to 4.
10. Checklist for reviewers? (cf emails with Larry ~ 2007-07-20)
11. "Clear utility" -- see Larry email 2010-01-29 (widget:)
12. Syntactic compatibility of provisional schemes -- see 2014-10-18.  Problems have occurred in practice.  Also 2019-04-10 (first-run-pen-experience)
13. Normative referencing discussion 2015-03-19.
14. [[[RFC 7595, procedure step 7, conflict resolution:  inconsistent - if the DE doesn't review provisional requests then the reconciliation described cannot happen.  NOT SO:  review is invoked if the name is already registered.]]]
15. No clear requirement for there to be a scheme specification ... *except* in the template references it says "A scheme specification is only required for 'permanent' registration."  I think the requirements section (3) should make documentation explicit (e.g. under "Well Defined").  Also, for permanent, no requirement fort spec to be open, publicly accessible, and published at a stable location.  Also make explicit reference to spec in section 7?
16. No clear statement of the level of review expected for permanent registration, even though sect 7.1 states "...is to ensure that the normal open review process has been properly followed..."
17. Bogus provisional registrations - cf email 2022-08-18 - have some way to block these?
18. My email 2015-07-16 (normative requirements with no process to check.)
19. 2015-07-21 email (template supplied in non-text document)
20. Specification required?  see 2016-10-13
21. dpp: 2018-12-27 - comments about lack of consensus vs deployed use
22. Discussion of ISE RFCs and conflict review about 2019-01-06
23. Templates and specifications: 2020-10-21
24. Drafts always provisional: 2021-09-03
25. 





meta issue:  2013-08-19  (mentions RFC 5785)
2014-03-13: mention of  changes to URI registration afoot at London IETF meet


Discussion with Alexey before 2010-06-30?  See 2010-06-15 sent

"""
NOTE: although presenting for review at URI-review@ietf.org is not a requirement for provisional registration, failure to do so may lead to problems with any subsequent request for permanent registration.
"""
(cf. coswid, drop, etc.)


.... drop scheme

2020-05-03
2020-05-04
2020-05-08
2020-06-02 (notes need to fix syntax before effort another issues)
2020-06-26





Not much time to document this, sorry...

 * See: [mappings](mappings)
    * [cl](mappings/lmha-to-cl.sssom.tsv)
    * [uberon](mappings/lmha-to-uberon.sssom.tsv)
    * [no mappings](mappings/lmha-nomatches.sssom.tsv)

All mappings are in SSSOM format

They are generated automatically using rdf_matcher, but using existing xrefs as priors. These have high confidence, as the assumption is that previously curated xrefs are high quality, but the prior weightings can be altered

E.g


|subject_id|subject_label|subject_category|predicate_id|object_id|object_label|object_category|match_type|subject_source|object_source|mapping_tool|confidence|subject_match_field|object_match_field|match_string|comment|
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
|LMHA:00090|basophil|Respiratory_System|owl:equivalentClass|CL:0000767|basophil|cell|Lexical|LMHA|CL|rdf_matcher|0.9783866146851686|oio:hasDbXref|dc:identifier|CL:0000767|.|
|LMHA:00179|granulocyte|Respiratory_System|owl:equivalentClass|CL:0000094|granulocyte|cell|Lexical|LMHA|CL|rdf_matcher|0.9784559180850925|oio:hasDbXref|dc:identifier|CL:0000094|.|

If there is a match using something like a synonym or shared xref then this will get lower confidence:

|subject_id|subject_label|subject_category|predicate_id|object_id|object_label|object_category|match_type|subject_source|object_source|mapping_tool|confidence|subject_match_field|object_match_field|match_string|comment|
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
|LMHA:00183|hyaline cartilage|general_tissue_structures|owl:equivalentClass|UBERON:0001994|hyaline cartilage tissue|uberon|Lexical|LMHA|UBERON|rdf_matcher|0.4482245494091784|rdfs:label|oio:hasExactSynonym|hyaline cartilage|.|

Note I deliberately included all *candidate* mappings, e.g. there are 3 matches for LMHA:00150

|subject_id|subject_label|subject_category|predicate_id|object_id|object_label|object_category|match_type|subject_source|object_source|mapping_tool|confidence|subject_match_field|object_match_field|match_string|comment|
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
|LMHA:00150|dendritic cell|Cell|owl:equivalentClass|CL:0000451|dendritic cell|cell|Lexical|LMHA|CL|rdf_matcher|0.4827360284687321|rdfs:label|rdfs:label|dendritic cell|.|
|LMHA:00150|dendritic cell|Cell|owl:equivalentClass|CL:0001056|dendritic cell, human|cell|Lexical|LMHA|CL|rdf_matcher|0.16884322574902352|rdfs:label|oio:hasBroadSynonym|dendritic cell|.|
|LMHA:00150|dendritic cell|Cell|owl:equivalentClass|CL:0000738|leukocyte|cell|Lexical|LMHA|CL|rdf_matcher|0.9577300291303523|oio:hasDbXref|dc:identifier|CL:0000738|.|

 - The lowest match to 'human dendritic cell' has a confidence of ~0.16, and this one is  too specific (although arguably this is the correct one since LMHA is *human*, however, CL does not consistent populate human-specific groupings, so it is better to map to the same level of generality)
 - the middle match (confidence 0.48) is the correct one
 - interestingly the "best" match (confidence 0.96) is to leukocyte. This is clearly incorrect. But it highlights the fact that there is an incorrect curated xref in the LMHA ontology, and we should downweight these

It would be possible for me to do something more advanced to filter and better prioritize these but for now I think it is informative and transparent to show all candidate mappings to give curators a sense of the issues

# unmapped LMHA terms

ones for which neither xref nor lexical match found:

 * [no mappings](mappings/lmha-nomatches.sssom.tsv)

This is being used to gapfill: https://github.com/mapping-commons/lmha-obo-mappings/issues/1


# TODO

 - make a useful report that shows which mappings are likely yet not present in source LMHA (trivial)
 - configuring mapping weights
 - run boomer


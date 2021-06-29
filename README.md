Not much time to document this, sorry...

 * See: [mappings](mappings)
    * [cl](mappings//lmha-to-cl.sssom.tsv)
    * [uberon](mappings//lmha-to-uberon.sssom.tsv)

All mappings are in SSSOM format

They are generated automatically, but using existing xrefs as priors. These have high confidence

E.g


|subject_id|subject_label|subject_category|predicate_id|object_id|object_label|object_category|match_type|subject_source|object_source|mapping_tool|confidence|subject_match_field|object_match_field|match_string|comment|
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
|LMHA:00090|basophil|http://purl.obolibrary.org/obo/http%3A//www.lungmap.net/ontologies/human_anatomy#Respiratory_System|owl:equivalentClass|CL:0000767|basophil|cell|Lexical|LMHA|CL|rdf_matcher|0.9783866146851686|oio:hasDbXref|dc:identifier|CL:0000767|.|
|LMHA:00179|granulocyte|http://purl.obolibrary.org/obo/http%3A//www.lungmap.net/ontologies/human_anatomy#Respiratory_System|owl:equivalentClass|CL:0000094|granulocyte|cell|Lexical|LMHA|CL|rdf_matcher|0.9784559180850925|oio:hasDbXref|dc:identifier|CL:0000094|.|

If there is a match using something like a synonym or shared xref then this will get lower confidence:

|subject_id|subject_label|subject_category|predicate_id|object_id|object_label|object_category|match_type|subject_source|object_source|mapping_tool|confidence|subject_match_field|object_match_field|match_string|comment|
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
|LMHA:00183|hyaline cartilage|http://purl.obolibrary.org/obo/http%3A//www.lungmap.net/ontologies/human_anatomy#general_tissue_structures|owl:equivalentClass|UBERON:0001994|hyaline cartilage tissue|uberon|Lexical|LMHA|UBERON|rdf_matcher|0.4482245494091784|rdfs:label|oio:hasExactSynonym|hyaline cartilage|.|



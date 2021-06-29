Not much time to document this, sorry...

 * See: [mappings](mappings)

All mappings are in SSSOM format

They are generated automatically, but using existing xrefs as priors. These have high confidence

E.g


|subject_id|subject_label|subject_category|predicate_id|object_id|object_label|object_category|match_type|subject_source|object_source|mapping_tool|confidence|subject_match_field|object_match_field|match_string|comment|
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
|LMHA:00331|right lung middle lobar bronchus|http://purl.obolibrary.org/obo/http%3A//www.lungmap.net/ontologies/human_anatomy#Respiratory_System|owl:equivalentClass|UBERON:0012063|lobar bronchus of right lung middle lobe|uberon|Lexical|LMHA|UBERON|rdf_matcher|0.9784659411798694|oio:hasDbXref|dc:identifier|UBERON:0012063|.|
|LMHA:00030|right middle lobe bronchiole|http://purl.obolibrary.org/obo/http%3A//www.lungmap.net/ontologies/human_anatomy#Respiratory_System|owl:equivalentClass|UBERON:0012068|right lung middle lobe bronchiole|uberon|Lexical|LMHA|UBERON|rdf_matcher|0.978458140912151|oio:hasDbXref|dc:identifier|UBERON:0012068|.|

If there is a match using something like a synonym or shared xref then this will get lower confidence:

|subject_id|subject_label|subject_category|predicate_id|object_id|object_label|object_category|match_type|subject_source|object_source|mapping_tool|confidence|subject_match_field|object_match_field|match_string|comment|
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
|LMHA:00183|hyaline cartilage|http://purl.obolibrary.org/obo/http%3A//www.lungmap.net/ontologies/human_anatomy#general_tissue_structures|owl:equivalentClass|UBERON:0001994|hyaline cartilage tissue|uberon|Lexical|LMHA|UBERON|rdf_matcher|0.4482245494091784|rdfs:label|oio:hasExactSynonym|hyaline cartilage|.|



OBO = http://purl.obolibrary.org/obo

SRC = downloads/lmha.ttl

MAP_TO = uberon cl

HACKYFIX = perl -pi -ne 's@http://purl.obolibrary.org/obo/http%3A//www.lungmap.net/ontologies/human_anatomy\#@@'

all: $(patsubst %, mappings/lmha-to-%.sssom.tsv, $(MAP_TO)) mappings/lmha-nomatches.sssom.tsv

mappings/auto-lmha-to-%.sssom.tsv: downloads/%.owl $(SRC)
	rdfmatch -p LMHA -w conf/lmha_weights.pro -i conf/prefixes.ttl -i $(SRC) -i $< match > $@
.PRECIOUS: mappings/auto-lmha-to-%.sssom.tsv

mappings/lmha-nomatches.sssom.tsv: $(SRC)
	rdfmatch -p LMHA -w conf/lmha_weights.pro -i conf/prefixes.ttl -i $(SRC) -i downloads/cl.owl -i downloads/uberon.owl nomatch > $@.tmp && grep -v ^# $@.tmp | cut -f1,2,13 > $@ && $(HACKYFIX) $@

mappings/lmha-to-%.sssom.tsv: mappings/auto-lmha-to-%.sssom.tsv
	python -m sssom.cli dedupe -i $< -o $@ && $(HACKYFIX) $@

downloads/%.owl:
	robot merge -I $(OBO)/$*.owl -o $@
.PRECIOUS: downloads/%.owl

$(SRC): 
	robot merge -i downloads/lmha-download.owl -i conf/lmha-bridge.ttl -o $@
.PRECIOUS: $(SRC)

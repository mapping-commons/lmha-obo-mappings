OBO = http://purl.obolibrary.org/obo

MAP_TO = uberon cl

all: $(patsubst %, mappings/lmha-to-%.sssom.tsv, $(MAP_TO))
mappings/auto-lmha-to-%.sssom.tsv: downloads/%.owl
	rdfmatch -p LMHA -w conf/lmha_weights.pro -i conf/prefixes.ttl -i downloads/lmha.owl -i $< match > $@
.PRECIOUS: mappings/auto-lmha-to-%.sssom.tsv

mappings/lmha-to-%.sssom.tsv: mappings/auto-lmha-to-%.sssom.tsv
	python -m sssom.cli dedupe -i $< -o $@

downloads/%.owl:
	robot merge -I $(OBO)/$*.owl -o $@
.PRECIOUS: downloads/%.owl

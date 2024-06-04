GENERATE ?= https://kure.sh/cmd/generate@0.1/main.ts
INGEST_GO ?= kure-ingest-go

.PHONY: all src schema ts

all: schema ts

src:
	git clone --depth 1 --branch $(REF) $(SOURCE) $@

schema: 
	$(INGEST_GO) -d src -o $@ $(PACKAGES)

ts: schema
	deno run --allow-read=$< --allow-write=$< "$(GENERATE)" --write $<


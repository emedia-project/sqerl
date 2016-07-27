include bu.mk

.PHONY: doc

all: compile

compile:
	$(verbose) $(REBAR) compile

test: compile
	$(verbose) $(REBAR) eunit

distclean:
	$(verbose) $(RM_RF) deps _build rebar.lock

doc:
	$(verbose) $(REBAR) as doc edoc


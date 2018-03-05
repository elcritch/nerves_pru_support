SRCDIRS = src
SUBDIRS = pru/lib/rpmsg pru/lib/pru_support pru/lib/msgpack pru/lib/softspi
TEST_SUBDIRS = test/softspi_test

ARTIFACT_DIR = _build/pru

ifeq ($(MIX_ENV),test)
SUBDIRS += $(TEST_BUDIRS)
endif

all: $(SRCDIRS)

$(SRCDIRS):
	$(MAKE) -C $@

artifact: $(SUBDIRS)

test: $(TEST_SUBDIRS)

artifact_build:
	mkdir -p $(ARTIFACT_DIR)/include
	cp -RL pru/include/* $(ARTIFACT_DIR)/include/

clean_artifact:
	rm -Rf $(ARTIFACT_DIR)/

$(SUBDIRS): artifact_build
	env | grep -i pru | sort
	$(MAKE) -C $@

$(TEST_SUBDIRS): artifact_build
	$(MAKE) -C $@

clean: clean_artifact
	@for d in $(SUBDIRS); do (cd $$d; $(MAKE) clean ); done
	@for d in $(TEST_SUBDIRS); do (cd $$d; $(MAKE) clean ); done

.PHONY: $(SUBDIRS)

SUBDIRS = src pru/lib/rpmsg pru/lib/pru_support pru/lib/msgpack pru/lib/softspi
TEST_SUBDIRS = test/softspi_test

ifeq ($(MIX_ENV),test)
SUBDIRS += $(TEST_BUDIRS)
endif

#export PRU_CGT=$(shell mix nerves.path.artifact extras_toolchain_pru_cgt)/ti-cgt-pru

all: $(SUBDIRS)

test: $(TEST_SUBDIRS)

priv_dir:
	mkdir -p priv/pru/include
	cp -RL pru/include/* priv/pru/include/

clean_priv:
	rm -Rf priv/pru/

$(SUBDIRS): priv_dir
	env | grep -i pru | sort
	$(MAKE) -C $@

$(TEST_SUBDIRS): priv_dir
	$(MAKE) -C $@ 

clean: clean_priv
	@for d in $(SUBDIRS); do (cd $$d; $(MAKE) clean ); done
	@for d in $(TEST_SUBDIRS); do (cd $$d; $(MAKE) clean ); done

.PHONY: $(SUBDIRS)

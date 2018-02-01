SUBDIRS = src pru/lib/rpmsg pru/lib/pru_support pru/lib/msgpack

export PRU_CGT=$(shell mix nerves.path.artifact extras_toolchain_pru_cgt)/ti-cgt-pru

all: $(SUBDIRS)

priv_dir:
	mkdir -p priv/pru/include
	cp -RL pru/include/* priv/pru/include/

clean_priv:
	rm -Rf priv/pru/

$(SUBDIRS): priv_dir
	$(MAKE) -C $@

clean: clean_priv
	@for d in $(SUBDIRS); do (cd $$d; $(MAKE) clean ); done

.PHONY: $(SUBDIRS)

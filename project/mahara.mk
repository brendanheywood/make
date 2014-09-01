#
# shared targets between moodle / drupal / mahara
include $(ROOT)/project/shared.mk

CfgFile = htdocs/config.php
CfgObj = cfg

# Lookup mahara config
ifeq ($(wildcard $(CfgFile)),)
$(error "Can't find Mahara config file $(CfgFile)")
endif


# load in database targets
LocalDBType   = $(shell ./$(ROOT)/extract $(CfgFile) $(CfgObj) dbtype)
LocalDBHost   = $(shell ./$(ROOT)/extract $(CfgFile) $(CfgObj) dbhost)
LocalDBName   = $(shell ./$(ROOT)/extract $(CfgFile) $(CfgObj) dbname)
LocalDBUser   = $(shell ./$(ROOT)/extract $(CfgFile) $(CfgObj) dbuser)
LocalDBPass   = $(shell ./$(ROOT)/extract $(CfgFile) $(CfgObj) dbpass)
include $(ROOT)/database/load.mk

# load in common web targets
LocalWebRoot  = $(shell ./$(ROOT)/extract $(CfgFile) $(CfgObj) wwwroot)
include $(ROOT)/web/load.mk

# load in sitedata targets
LocalSitedata = $(shell ./$(ROOT)/extract $(CfgFile) $(CfgObj) dataroot)
include $(ROOT)/sitedata/load.mk

test:
	@# As a general rule we don't want too much app login in this make repo so
	@# just call out to the moodle specific stuff instead of doing it here
	@# TODO ./local/catalyst-test/runtests-ci.sh


# almost targets should always be .phony
.phony : test

#
# shared targets between moodle / drupal / mahara
include $(ROOT)/project/shared.mk

CfgFile = config.php
CfgObj = CFG

ifeq ($(wildcard $(CfgFile)),)
$(error "Can't find Moodle config file $(CfgFile)")
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


composer.phar:
	curl -s https://getcomposer.org/installer | php

test: composer.phar

	php composer.phar install --dev
	@#
	@# As a general rule we don't want too much app login in this make repo so
	@# just call out to the moodle specific stuff instead of doing it here
	./local/catalysttest/runtests-ci.sh

# almost all targets should always be .phony
.phony : test


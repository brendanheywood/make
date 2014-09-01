# Just a boostrap file
#


ifneq ($(wildcard $(RestoreType)),)
$(error "RestoreType isn't set! Should be something like 'vedra' or 'stage' $(RestoreType)")
endif

# For now just use default
include $(ROOT)/sitedata/default.mk

# load in restore targets
include $(ROOT)/sitedata/source/$(RestoreType).mk

config-sitedata:
	##########################
	# Sitedata               #
	##########################
	@echo " LocalSitedata: $(LocalSitedata)"
	@echo

# Almost targets should always be .PHONY
.PHONY : config-sitedata refresh-sitedata-retrieve

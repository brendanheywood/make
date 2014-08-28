# Lookup moodle config

LocalDBType   = $(shell ./make/extract config.php dbtype)
LocalDBHost   = $(shell ./make/extract config.php dbhost)
LocalDBName   = $(shell ./make/extract config.php dbname)
LocalDBUser   = $(shell ./make/extract config.php dbuser)
LocalDBPass   = $(shell ./make/extract config.php dbpass)
LocalWebRoot  = $(shell ./make/extract config.php wwwroot)
LocalSitedata = $(shell ./make/extract config.php dataroot)

# load in database targets
include make/database/load.mk

# load in sitedata targets
include make/sitedata/load.mk

# This declares that a moodle refresh entails both a DB restore and a sitedata restore
refresh: refresh-database refresh-sitedata

config-project:
	##########################
	# Moodle config          #
	##########################
	@echo
	@echo "LocalDBType:   $(LocalDBType)"
	@echo "LocalDBHost:   $(LocalDBHost)"
	@echo "LocalDBName:   $(LocalDBName)"
	@echo "LocalDBUser:   $(LocalDBUser)"
	@echo "LocalDBUser:   $(LocalDBPass)"
	@echo
	@echo "LocalWebRoot:  $(LocalWebRoot)"
	@echo
	@echo "LocalSitedata: $(LocalSitedata)"


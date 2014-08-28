# Just a boostrap file
#

LocalBackupName ?= $(LocalDBName)-$(shell date +'%Y-%m-%d')
LocalBackupDir  ?= /tmp/
LocalBackup     ?= $(LocalBackupDir)$(LocalBackupName)

# Load DB driver
include make/database/$(LocalDBType)/load.mk

# load in restore targets
include make/database/$(LocalDBType)/source/$(RestoreType).mk

config-database:
	##########################
	# Database config        #
	##########################
	@echo "LocalBackupName: $(LocalBackupName)"
	@echo "LocalBackupDir:  $(LocalBackupDir)"
	@echo



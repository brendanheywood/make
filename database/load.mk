# Just a boostrap file
#

LocalBackupName ?= $(LocalDBName)-$(shell date +'%Y-%m-%d')
LocalBackupDir  ?= /tmp/
LocalBackup     ?= $(LocalBackupDir)$(LocalBackupName)


ifneq ($(wildcard $(LocalDBType)),)
$(error "LocalDBType isn't set! '$(LocalDBType)' $(CFG), should be something like 'mysql' or'postgres'")
endif

# Load DB driver
include $(ROOT)/database/$(LocalDBType)/load.mk

# load in restore targets
include $(ROOT)/database/$(LocalDBType)/source/$(RestoreType).mk

config-database:
	##########################
	# Database config        #
	##########################
	@echo " LocalDBType:     $(LocalDBType)"
	@echo " LocalDBHost:     $(LocalDBHost)"
	@echo " LocalDBName:     $(LocalDBName)"
	@echo " LocalDBUser:     $(LocalDBUser)"
	@echo " LocalDBUser:     $(LocalDBPass)"
	@echo " LocalBackupName: $(LocalBackupName)"
	@echo " LocalBackupDir:  $(LocalBackupDir)"
	@echo

# Almost targets should always be .PHONY
.PHONY : config-database refresh-database sql-cli init-database


# Just a boostrap file
#

# Load DB driver
include make/database/$(LocalDBType).mk

# load in restore targets
include make/database/source/$(RestoreType).mk



# Just a boostrap file
#

# For now just use default
include make/sitedata/default.mk

# load in restore targets
include make/sitedata/source/$(RestoreType).mk


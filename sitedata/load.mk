# Just a boostrap file
#

# The default restore type is vedra
RestoreType ?= vedra

# For now just use default
include make/sitedata/default.mk

# load in restore targets
include make/sitedata/source/$(RestoreType).mk


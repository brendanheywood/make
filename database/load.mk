# Just a boostrap file
#

# The default restore type is vedra
RestoreType ?= vedra

# Load DB driver
include make/database/$(LocalDBType).mk

# load in restore targets
include make/database/source/$(RestoreType).mk



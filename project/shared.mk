#
# This is a refactoring of common setup between most project types
#


# The default restore type is vedra
RestoreType ?= vedra


refresh:        refresh-database refresh-sitedata
config-project : config-database  config-sitedata config-web



#
# This is a refactoring of common setup between most project types
#
# init - this auto creates stuff locally to get you up and running fast
#


# The default restore type is vedra
RestoreType ?= vedra


refresh:        refresh-database refresh-sitedata
config-project : config-database  config-sitedata config-web
init :             init-database    init-sitedata   init-web



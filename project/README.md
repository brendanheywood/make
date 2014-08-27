Project targets
---------------

Each project type should defined several standard targets:

* project-detect-config - does as much auto config as it can
* project-debug-config - shows what config it has auto detected
* dev-config

* refresh-from-($ENVS)

Each project will probably also detect a bunch of config and then load up
 a particular set of DB targets accordinly

# - db driver
# - db host
# - db name
# - db user
# - db password
# - db root user


Database targets
----------------

Think of this as a collection of databse drivers

Each driver implements a set of common tasks:

* sql-cli
* sql-query
* restore-from-tmp

Which driver is loaded depends on the $(LocalDBType) variable. This
variable is either detected automatically where possible
or you can set it manually.


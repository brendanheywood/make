Sitedata targets
----------------

The will probably only be one implementation of a sitedata as they are
pretty well the same from app to app. All implementations should have:

* refresh-sitedata
* init-sitedata - auto creates the local site data directory

Note that the 'project's refresh target should have a dependancy on this.



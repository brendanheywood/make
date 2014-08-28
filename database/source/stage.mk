# This store is used for making backups directly from a demo or stage server.
# It probably shouldn't be used as backups should be put into vedra in a
# sane fashion and use the 'vedra' store instead, but this still has value
# as a working test implementation and also may have value for clients who
# do things their own way.
#
# To configure add these to your root Makefile:
#
# RestoreRtype=stage
# RestoreDBHost=ahnedevweb01
#
# If all the database settings are the same as local that's it, if they are
# different then set them explicitly:


refresh-database-retrieve:
	@echo "== refresh-database-retrieve =="
	@echo
	@# This takes about a minute...
	@# sudo -u postgres pg_dump -Fc alfredhealth-moodle > /tmp/alfredhealth-moodle.sql.gz
	@# This takes up to 15 minutes ...
	@# scp $(StageDB):/tmp/alfredhealth-moodle.sql.gz /tmp/


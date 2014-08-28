# This store is used for making backups directly from vedra.
#
# As this is the default it auto configures with everything you need
# with lots of assumptions about how backups are made elsewhere and
# stored on vedra with filenaming conventions etc


refresh-database-retrieve:
	@echo "== refresh-database-retrieve =="
	@echo
	@# This takes about a minute...
	@# sudo -u postgres pg_dump -Fc alfredhealth-moodle > /tmp/alfredhealth-moodle.sql.gz
	@# This takes up to 15 minutes ...
	@# scp $(StageDB):/tmp/alfredhealth-moodle.sql.gz /tmp/


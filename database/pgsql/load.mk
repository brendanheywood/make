
refresh-database: refresh-database-retrieve
	@echo "== refresh-database =="
	@echo
	@# sudo -u postgres pg_restore -d alfredhealth-moodle /tmp/alfredhealth-moodle.sql.gz
	@# This takes up to 10 minutes ...
	@#sudo -l
	@#sudo -u postgres pg_restore -d alfredhealth-moodle /tmp/alfredhealth-moodle.sql.gz

sql-cli:
	export PGPASSWORD=$(LocalDBPass); psql -h $(LocalDBHost) $(LocalDBName) $(LocalDBUser)


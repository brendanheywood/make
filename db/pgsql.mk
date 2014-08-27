
restore-from-tmp:

	# sudo -u postgres pg_restore -d alfredhealth-moodle /tmp/alfredhealth-moodle.sql.gz


sql-cli:
	export PGPASSWORD=$(LocalDBPass); psql -h $(LocalDBHost) $(LocalDBName) $(LocalDBUser)




LocalDBSudoUser ?= postgres


refresh-database: refresh-database-retrieve refresh-database-restore

refresh-database-restore:
	@echo "== refresh-database-restore =="
	@echo
	sudo -u $(LocalDBSudoUser) pg_restore -c -d $(LocalDBName) $(LocalBackup).sql.gz
	@# -c Drop DB first
	@#

sql-cli:
	export PGPASSWORD=$(LocalDBPass); psql -h $(LocalDBHost) $(LocalDBName) $(LocalDBUser)


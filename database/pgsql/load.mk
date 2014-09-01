
LocalDBSudoUser ?= postgres


refresh-database: refresh-database-retrieve refresh-database-restore

refresh-database-restore:
	@echo "== refresh-database-restore =="
	@echo
	sudo -u $(LocalDBSudoUser) pg_restore -c -d $(LocalDBName) $(LocalBackup).sql.gz
	@# -c Drop DB first
	@#

sql-cli:
	@export PGPASSWORD=$(LocalDBPass); psql -h $(LocalDBHost) $(LocalDBName) $(LocalDBUser)

init-database:
	# WARNING this will fail if you run it a second time TODO make idempotent
	# Create the local DB user
	sudo -u $(LocalDBSudoUser) psql -c "CREATE USER \"$(LocalDBUser)\" WITH ENCRYPTED PASSWORD '$(LocalDBPass)';"
	# Create the local Database
	sudo -u $(LocalDBSudoUser) createdb -O $(LocalDBUser) -E UTF8 $(LocalDBName)
	@# -O  - owner
	@# -E  - encoding



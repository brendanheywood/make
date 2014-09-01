#
refresh-database:
	@echo "== refresh-database =="
	@echo


sql-cli:
	@mysql -u $(LocalDBUser) --password='$(LocalDBPass)' $(LocalDBName)

init-database:
	# create the db locally




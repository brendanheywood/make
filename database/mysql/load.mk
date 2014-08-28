#
refresh-database:
	@echo "== refresh-database =="
	@echo


sql-cli:
	@mysql -u $(LocalDBUser) --password='$(LocalDBPass)' $(LocalDBName)

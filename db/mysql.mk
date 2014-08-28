
restore-from-tmp:
	@echo "Restore"

sql-cli:
	@mysql -u $(LocalDBUser) --password='$(LocalDBPass)' $(LocalDBName)


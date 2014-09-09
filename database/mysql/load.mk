#
LocalDBSudoUser ?= root

refresh-database:
	@echo "== refresh-database =="
	@echo


sql-cli:
	@mysql -u $(LocalDBUser) --password='$(LocalDBPass)' $(LocalDBName)

init-database:
	# WARNING this will fail if you run it a second time TODO make idempotent
	# Create the local Database
	sudo -u $(LocalDBSudoUser) mysql -e 'CREATE DATABASE IF NOT EXISTS $(LocalDBName) DEFAULT CHARACTER SET UTF8 COLLATE utf8_unicode_ci;'
	# Create the local DB user and grant access
	sudo -u $(LocalDBSudoUser) mysql -e "GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,CREATE TEMPORARY TABLES,DROP,INDEX,ALTER ON $(LocalDBName).* TO $(LocalDBUser)@localhost IDENTIFIED BY '$(LocalDBPass)'";



# This store is used for making backups directly from a demo or stage server.
# It probably shouldn't be used as backups should be put into vedra in a
# sane fashion and use the 'vedra' store instead, but this still has value
# as a working test implementation and also may have value for clients who
# do things their own way.
#
# This assumes that you have ssh access, and sudo access as the postgres user
#
# The minimum config to add to your root Makefile:
#
#  RestoreType=stage                      # tell make to this this backup source
#  RestoreDBHost=ahnedevweb01             # the hostname of the database server
#
# The rest will probably just work, if not set it explicitly

RestoreDBSudoUser ?= postgres
RestoreDBName     ?= $(LocalDBName)
RestoreDBUser     ?= $(LocalDBUser)

RestoreBackupName ?= stage-$(LocalBackupName)
RestoreBackupDir  ?= $(LocalBackupDir)
RestoreBackup     ?= $(LocalBackupDir)$(RestoreBackupName)


ifeq ($(RestoreDBHost),)
$(error Missing config: Please add RestoreDBHost to your Makefile )
endif

refresh-database-retrieve:
	@echo "== refresh-database-retrieve: stage =="
	@echo
	@#
	@# This target backs up the remote database
	@# It only does it if there is not a backup made today, so if
	@# you run it twice it should exit quickly
	@#
	ssh -t $(RestoreDBHost) "[ -f $(RestoreBackup).sql.gz ] || sudo -u $(RestoreDBSudoUser) pg_dump -Fc -v $(RestoreDBName) > $(RestoreBackup).sql.gz"
	@echo
	@#
	@# Now rsync progressive the backup over
	@# we use progressive so if network fails we just run again to resume
	@#
	rsync -arv -h --partial --progress $(RestoreDBHost):$(RestoreBackup).sql.gz $(LocalBackupDir)
	@echo
	@#



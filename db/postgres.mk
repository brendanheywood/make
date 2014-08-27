
restore-from-tmp:

	sudo -u postgres pg_restore -d alfredhealth-moodle /tmp/alfredhealth-moodle.sql.gz

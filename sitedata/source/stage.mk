

refresh-sitedata-retrieve:
	@echo "== refresh-sitedata-retrieve: stage =="
	@echo
	@# /var/lib/sitedata/moodle-site-alfredhealth
	@#rsync --dry-run -arv $(STAGEWEB):/var/lib/sitedata/moodle-site-alfredhealth  /var/lib/sitedata/moodle-site-alfredhealth
	@#rsync -arv $(STAGEWEB):/var/lib/sitedata/moodle-site-alfredhealth  /var/lib/sitedata/

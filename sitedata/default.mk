
LocalSiteDataSudoUser ?= www-data

refresh-sitedata: refresh-sitedata-retrieve
	@echo "== refresh-sitedata =="
	@echo
	@# ungip something
	@# or rsync something
	@#
	@# then do the restore gunzip
	@#

init-sitedata:
	# auto create the sitedata dir
	sudo -u $(LocalSiteDataSudoUser) mkdir -p $(LocalSitedata) --mode=775


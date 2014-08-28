#
# WARNING: This is not a 'project' type, it is merely a refactoring of
# make targets which are shared by other projects, namely drupal, moodle
# and mahara.
#


# Copy to /tmp on your local box

#
rsync-site-data:
	@echo "Syncing site page"



tail:
# reach into apache
# detect logfile
# if needed detect rsyslog
# trace path
	tail -f $(LocalWebLog)




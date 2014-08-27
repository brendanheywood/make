#
# These targets are common for most types of 'web' projects
# including moodle, drupal
#
#



# Configured to point to vedra
# Configured to look under path xyz on vedra
# Configured to grab the latest version
# Copy to /tmp on your local box
# Restore
# DB Config in env

#
rsync-site-data:
	@echo "Syncing site page"



tail:
# reach into apache
# detect logfile
# if needed detect rsyslog
# trace path
	tail -f $(LocalWebLog)




#
# This is for all targets related to apps that serve http via apache
#
# There may end up being a similar driver setup to enable different
# implementations depending on apache / nginx / unicorn etc
#


ifneq ($(wildcard $(LocalWebRoot)),)
$(error "LocalWebRoot isn't set! Should be something like '/var/www/blah' $(LocalWebRoot)")
endif

LocalWebDir      = $(shell pwd)
LocalWebConf     = $(shell grep -l $(LocalWebDir) /etc/apache2/sites-enabled/*)
LocalWebErrorLog = $(shell grep ErrorLog $(LocalWebConf) | sed 's/ErrorLog//' | sed 's/\s//g' | sed 's/^/\/var\/log\/apache2/'  )

#
web-open:
	@echo "URL: $(LocalWebRoot)"
	@xdg-open $(LocalWebRoot)

config-web:
	##########################
	# Web config             #
	##########################
	@echo " LocalWebDir:   $(LocalWebDir)"
	@echo " LocalWebRoot:  $(LocalWebRoot)"
	@echo " LocalWebConf:  $(LocalWebConf)"
	@echo " LocalWebErrorLog:  $(LocalWebErrorLog)"
	@echo " LocalWebAccessLog: $(LocalWebAccessLog)"
	@echo

tail-error:
	tail -f $(LocalWebErrorLog) | sed 's/\\n/\n/g'

init-web:
	@# no-op, could create apache conf?


# Almost all targets should always be .PHONY
.PHONY : config-web web-open tail-error init-web



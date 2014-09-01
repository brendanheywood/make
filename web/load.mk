#
# This is for all targets related to apps that serve http
#
# There may end up being a similar driver setup to enable different
# implementations depending on apache / nginx / unicorn etc
#


ifneq ($(wildcard $(LocalWebRoot)),)
$(error "LocalWebRoot isn't set! Should be something like '/var/www/blah' $(LocalWebRoot)")
endif

#
web-open:
	@echo "URL: $(LocalWebRoot)"
	@xdg-open $(LocalWebRoot)

config-web:
	##########################
	# Web config             #
	##########################
	@echo " LocalWebRoot:  $(LocalWebRoot)"
	@echo

tail-error:
	# reach into apache
	# detect logfile
	# if needed detect rsyslog
	# trace path
	tail -f $(LocalWebLog)

init-web:
	@# no-op, could create apache conf?


# Almost all targets should always be .PHONY
.PHONY : config-web web-open tail-error init-web



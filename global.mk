#                  _
#                 | |
#  _ __ ___   __ _| | _____
# | '_ ` _ \ / _` | |/ / _ \
# | | | | | | (_| |   <  __/
# |_| |_| |_|\__,_|_|\_\___|
#  _   _     _
# | | | |   (_)
# | |_| |__  _ _ __   __ _ ___
# | __| '_ \| | '_ \ / _` / __|
# | |_| | | | | | | | (_| \__ \
#  \__|_| |_|_|_| |_|\__, |___/
#                     __/ |
#                    |___/
#   ___  __ _ ___ _   _
#  / _ \/ _` / __| | | |
# |  __/ (_| \__ \ |_| |
#  \___|\__,_|___/\__, |
#                  __/ |
#                 |___/
#
#

# Look at README.md for more info


ROOT = make


# Detect what type of project we are
ifneq ($(wildcard version.php),)
ProjectType := moodle
endif
ifneq ($(wildcard htdocs/about.php),)
ProjectType := mahara
endif
ProjectType ?= unknown



DebianPackage = $(shell grep Package debian/control | cut -f2 -d' ')


# There should be almost no real targets in this file
# It should simply detect what 'type' of project we are and then
# load more targets accordingly
include $(ROOT)/project/$(ProjectType).mk

config: config-project
	##########################
	# Global config          #
	##########################
	@echo " Project type:   $(ProjectType)"
	@echo " Debian Package: $(DebianPackage)"
	@echo

# Almost targets should always be .PHONY
.PHONY : config


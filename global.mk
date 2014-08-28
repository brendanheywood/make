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


# Detect what type of project we are
ifneq ($(wildcard version.php),)
ProjectType := moodle
endif
ProjectType ?= unknown

# The default restore type is vedra
RestoreType ?= vedra


# There should be almost no real targets in this file
# It should simply detect what 'type' of project we are and then
# load more targets accordingly
include make/project/$(ProjectType).mk

config: config-project
	@echo
	##########################
	# Global config          #
	##########################
	@echo "Project type: $(ProjectType)"
	@echo "Project name: $(ProjectName)"
	@echo "Environments: $(EnvList)"

# Almost targets should always be .PHONY
.PHONY : config


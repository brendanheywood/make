#
# This is a standard library of make target components
# for use with most Catalyst projects
#
# This idea is that for a simple cooky-cutter style project you
# can just add this as a git submodule, then add a 1 liner to your
# make file, add the barrest minimum of config needed and then by
# black magic you get an easy way to refresh your box.
#
# If you which to extend or replace a target this should be easy too
#
# You can think of this as sort of like 'drush' except that it autodetects
# what your project is and adds or removes commands depending on what it finds
#
#


# split parts of makefiles apart, so a Makefile for mysql and a makefile for postgres
# a makefile for moodle, and a makefile for mahara etc
# the benefit of this is autocomplete. If a target doesn't make sense, then it should
# be available
# These secondary makefiles should only be pulled in after your master Makefile is
# conigured properly, eg to set the DB type, and the project type


# configure with a bug tracker default regex
# - defaults to WR# as commit prefix - detects this in commit checker


# Detect what type of project we are
ifneq ($(wildcard version.php),)
ProjectType := moodle
endif
ProjectType ?= unknown


# This is the list of environement you can refresh from
# Typically this would be just 'stage', but for more complex setups
# could be TODO
EnvList ?= stage


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


What is this?
=============

This is a standard library of make target components for use with most
Catalyst projects. It cleanly seperates the 'what' from the 'how' so
all projects use the same make targets regardless of what tech stack
they happen to use. To see what you can do, just type 'make' and press
tab to autocomplete the list of targets available to you.

This idea is that for a simple cooky-cutter style project you can just add
this as a git submodule, then add a 1 liner to your Makefile and then by
black magic you get an easy way to refresh your box, tail your logs,
refresh your config or whatever ever other common process every project
needs.

For project that have special needs this library is easily extended and
overridable to conform to practically any tech stack.

You can think of this as sort of like 'drush' except that it autodetects
what your project is and adds or removes command targets depending on what
each project requires


How to install
==============

If you're project is a 'normal'ish moodle, drupal, or mahara then
this a oneliner, just add this to your Makefile:

```include make/global.mk```

That's it!


How to contribute
=================


 split parts of makefiles apart, so a Makefile for mysql and a makefile for postgres
 a makefile for moodle, and a makefile for mahara etc
 the benefit of this is autocomplete. If a target doesn't make sense, then it should
 be available
 These secondary makefiles should only be pulled in after your master Makefile is
 conigured properly, eg to set the DB type, and the project type

 BEWARE of TABS vs spaces in Makefiles

 *VIM* add this to your .vimrc for correct tabs when editing Makefiles:

```
  " Don't convert tabs to space when in a Makefile
  :autocmd FileType make set noexpandtab
```

 configure with a bug tracker default regex
 - defaults to WR# as commit prefix - detects this in commit checker

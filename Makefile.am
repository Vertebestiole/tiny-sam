## Process this file with automake to produce Makefile.in

## Version and release date ##

EXTRA_DIST = $(top_srcdir)/.version $(top_srcdir)/.releasedate
BUILT_SOURCES = $(top_srcdir)/.version $(top_srcdir)/.releasedate
$(top_srcdir)/.version:
	echo $(VERSION) > $@-t && mv $@-t $@
$(top_srcdir)/.releasedate:
	echo $(tinysam_releasedate) > $@-t && mv $@-t $@
dist-hook:
	echo $(VERSION) > $(distdir)/.tarball-version
	echo $(tinysam_releasedate) > $(distdir)/.tarball-releasedate

## Binaries ##

bin_PROGRAMS =
include src/Makefile.mk

## Tests ##

AM_CPPFLAGS = -I$(top_srcdir)/src

noinst_PROGRAMS =
noinst_LIBRARIES =
TESTS =

include test/Makefile.mk

## Manual ##

pdf-local: # pdf-local-manual

include manual/Makefile.mk

## Building archive ##

archive_basename = $(builddir)/$(PACKAGE)-$(VERSION)-$(system_name)
archive_binaries_basename = $(archive_basename)/binaries

create-archive-folder:
	mkdir -p $(archive_basename)
	mkdir -p $(archive_binaries_basename)

binary-archive: all pdf create-archive-folder
#	$(MAKE) binary-archive-local-manual
	cp $(bin_PROGRAMS) $(archive_binaries_basename)
	tar -zcvf $(archive_basename).tar.gz $(archive_basename)

## Cleaning ##

MOSTLYCLEANFILES =
CLEANFILES =
DISTCLEANFILES =
MAINTAINERCLEANFILES =
REPOCLEANFILES = $(addprefix $(srcdir)/, aclocal.m4 configure config.guess config.sub depcomp install-sh Makefile.in missing test-driver)

clean-local: clean-local-src clean-local-test # clean-local-manual

distclean-local: # distclean-local-manual

repo-clean: maintainer-clean
	rm -rf $(REPOCLEANFILES)

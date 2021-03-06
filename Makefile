##
##  Makefile -- Build procedure for sample mecab Apache module
##  Autogenerated via ``apxs -n mecab -g''.
##

builddir=.
top_srcdir=/usr/share/apache2
top_builddir=/usr/share/apache2
include /usr/share/apache2/build/special.mk

#   the used tools
APXS=apxs
APACHECTL=apachectl

#   additional defines, includes and libraries
#DEFS=-Dmy_define=my_value
INCLUDES=`pkg-config --cflags json` `pkg-config --cflags apr-1` `apreq2-config --includes` `mecab-config --cflags`
#LIBS=`pkg-config --libs json` `pkg-config --libs apr-1`
CFLAGS = -std=c99 `pkg-config --libs json` `pkg-config --libs apr-1` `apreq2-config --ldflags --includes` -lapreq2 `mecab-config --libs` 

#   the default target
all: local-shared-build

#   install the shared object file into Apache 
install: install-modules-yes

#   cleanup
clean:
	-rm -f mod_mecab.o mod_mecab.lo mod_mecab.slo mod_mecab.la 

#   simple test
test: reload
	lynx -mime_header http://localhost/mecab

#   install and activate shared object by reloading Apache to
#   force a reload of the shared object file
reload: install restart

#   the general Apache start/restart/stop
#   procedures
start:
	$(APACHECTL) start
restart:
	$(APACHECTL) restart
stop:
	$(APACHECTL) stop


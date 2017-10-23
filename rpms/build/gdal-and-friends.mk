# the rules for the gdal and proj source archives are in gdal.mk

rpmbuild/SOURCES/zlib-1.2.11.tar.gz:
	curl -L "https://downloads.sourceforge.net/project/libpng/zlib/1.2.11/zlib-1.2.11.tar.gz?r=http%3A%2F%2Fwww.zlib.net%2F&ts=1490316463&use_mirror=pilotfiber" -o $@

rpmbuild/SOURCES/libpng-1.6.30.tar.xz:
	curl -L "https://downloads.sourceforge.net/project/libpng/libpng16/1.6.30/libpng-1.6.30.tar.xz?r=http%3A%2F%2Fwww.libpng.org%2Fpub%2Fpng%2Flibpng.html&ts=1502829944&use_mirror=iweb" -o $@

rpmbuild/SOURCES/geos-3.6.1.tar.bz2:
	curl -L "http://download.osgeo.org/geos/geos-3.6.1.tar.bz2" -o $@

rpmbuild/SOURCES/lcms2-2.8.tar.gz:
	curl -L "https://downloads.sourceforge.net/project/lcms/lcms/2.8/lcms2-2.8.tar.gz?r=&ts=1490316968&use_mirror=pilotfiber" -o $@

rpmbuild/SOURCES/openjpeg-v2.1.2.tar.gz:
	curl -L "https://github.com/uclouvain/openjpeg/archive/v2.1.2.tar.gz" -o $@

blobs/gdal-and-friends.tar.gz: scripts/build-gdal.sh \
   rpmbuild/SOURCES/gdal-2.1.3.tar.gz \
   rpmbuild/SOURCES/geos-3.6.1.tar.bz2 \
   rpmbuild/SOURCES/lcms2-2.8.tar.gz \
   rpmbuild/SOURCES/libpng-1.6.30.tar.xz \
   rpmbuild/SOURCES/proj-4.9.3.tar.gz \
   rpmbuild/SOURCES/openjpeg-v2.1.2.tar.gz \
   rpmbuild/SOURCES/zlib-1.2.11.tar.gz
	docker run -it --rm \
          -v $(shell pwd)/rpmbuild/SOURCES:/src:rw \
	  -v $(shell pwd)/blobs:/blobs:rw \
          -v $(shell pwd)/scripts:/scripts:ro \
          $(GCC4IMAGE) /scripts/build-gdal.sh $(shell id -u) $(shell id -g)
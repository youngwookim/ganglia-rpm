#!/bin/sh

rm -rf BUILD BUILDROOT SOURCES RPMS SRPMS tmp || true
mkdir -p BUILD RPMS SRPMS SOURCES tmp

wget -P ./SOURCES http://downloads.sourceforge.net/project/ganglia/ganglia%20monitoring%20core/3.6.0/ganglia-3.6.0.tar.gz 
wget -P ./SOURCES http://downloads.sourceforge.net/project/ganglia/ganglia-web/3.5.12/ganglia-web-3.5.12.tar.gz

# ganglia
rpmbuild -ba --define="_topdir $PWD" --define="_tmppath $PWD/tmp" --define="src $SRC" ganglia.spec

cp apache.conf SOURCES/
# ganglia-web
rpmbuild -ba --define="_topdir $PWD" --define="_tmppath $PWD/tmp" --define="src $SRC" ganglia-web.spec


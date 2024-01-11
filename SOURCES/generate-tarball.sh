#!/bin/bash
set -e

name=xalan-j2
version="$(sed -n 's/Version:\s*//p' *.spec)"

# RETRIEVE
wget "http://archive.apache.org/dist/xml/xalan-j/xalan-j_${version//./_}-src.tar.gz" -O "${name}-${version}.orig.tar.gz"

rm -rf tarball-tmp
mkdir tarball-tmp
cd tarball-tmp
tar xf "../${name}-${version}.orig.tar.gz"

# CLEAN TARBALL
find -name '*.jar' -delete
find -name '*.class' -delete
rm */src/*.tar.gz

tar cf "../${name}-${version}.tar.gz" *
cd ..
rm -r tarball-tmp "${name}-${version}.orig.tar.gz"

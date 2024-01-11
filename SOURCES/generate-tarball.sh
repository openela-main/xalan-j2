#!/bin/bash
set -e

name=xalan-j2
version="$(sed -n 's/Version:\s*//p' *.spec)"

# RETRIEVE
wget "http://apache.miloslavbrada.cz/xalan/xalan-j/source/xalan-j_${version//./_}-src.tar.gz" -O "${name}-${version}.orig.tar.gz"

rm -rf tarball-tmp
mkdir tarball-tmp
cd tarball-tmp
tar xf "../${name}-${version}.orig.tar.gz"

# CLEAN TARBALL
find -name '*.jar' -delete
find -name '*.class' -delete

tar czf "../${name}-${version}.tar.gz" *
cd ..
rm -r tarball-tmp "${name}-${version}.orig.tar.gz"

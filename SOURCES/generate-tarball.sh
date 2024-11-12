#!/bin/bash
set -e

name=xalan-j2
version="$(sed -n 's/Version:\s*//p' *.spec)"

# RETRIEVE
wget "https://archive.apache.org/dist/xalan/xalan-j/source/xalan-j_${version//./_}-src.tar.gz" -O "${name}-${version}.orig.tar.gz"

rm -rf tarball-tmp
mkdir tarball-tmp
cd tarball-tmp
tar xf "../${name}-${version}.orig.tar.gz"

# CLEAN TARBALL
find -name '*.jar' -delete
find -name '*.class' -delete
rm -r */samples

## NOTE xml-commons-external-1.3.02-src.tar.gz in version 2.7.2 contains free
## software but proprietary content in 2.7.3, make sure to check it
# rm */src/*.tar.gz

mv * ${name}-${version}
tar czf "../${name}-${version}.tar.gz" *
cd ..
rm -r tarball-tmp "${name}-${version}.orig.tar.gz"

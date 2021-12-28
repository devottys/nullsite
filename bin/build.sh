#!/bin/bash

BUILD=build

mkdir -p ${BUILD}
cp -v site/* ${BUILD}/
for i in site/*.md ; do
    OUTBASE=${i%.md}
    OUTSTEM=${OUTBASE#site/}
    OUTDIR=${BUILD}/${OUTSTEM#_} # remove leading underscore; needed for _.md (root page)
    OUTFN=${OUTDIR}/index.html
    echo $i '->' ${OUTFN}
    mkdir -p ${OUTDIR}
    cat header.html <(pandoc $i -w html) footer.html > ${OUTFN}
done

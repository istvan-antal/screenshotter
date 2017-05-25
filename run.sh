#!/bin/bash
set -eou pipefail
cd "$( dirname "${BASH_SOURCE[0]}" )"

rm -rf ./results
mkdir results

if [ ! -d "./bin" ]; then
    mkdir bin
fi

if [ ! -f "./bin/phantomjs" ]; then
    cd bin
    curl -O -L https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-macosx.zip
    unzip phantomjs-2.1.1-macosx.zip
    rm phantomjs-2.1.1-macosx.zip
    mv phantomjs-2.1.1-macosx/bin/phantomjs .
    rm -rf phantomjs-2.1.1-macosx
    cd ..
fi

printf "URL\tStatus\n" > results/urls.csv

while read i; do
    RESULT=$(./bin/phantomjs --ignore-ssl-errors=true rasterize.js "$i")
    printf "$i\t$RESULT\n" >> results/urls.csv
done < <(./process.py)
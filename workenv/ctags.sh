#!/bin/bash

ROOT_DIR=`pwd`

if [ -f ctags.log ]; then
    echo -e "\nExisting ctags.log deleted."
    rm ctags.log
fi

if [ -f tags ]; then
    echo "Existing tags deleted."
    rm tags
fi

touch ctags.log
touch tags

echo -e "\nBeginning ...\n"

i=0
for f in `find ${ROOT_DIR} -name "*.cpp" -or -name "*.h" -or -name "*.c"`; do
    if [ -f ${f} ]; then
        ((i++))
        echo "${f}" >> ctags.log
        ctags ${f} -o tags.tmp
        cat tags.tmp >> tags
    fi
done

rm tags.tmp

echo "${i} files tagged."

echo -e "\nFinished ...\n"


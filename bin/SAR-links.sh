#!/bin/bash

orig="yyyy-NNN-XX"
dest=${1/SAR-/""} # drop SAR prefix, if received

if [[ "$dest" == "" ]]
then
    echo "Usage: SAR-links.sh $orig"
    exit
fi

orig_short=${orig:0:8}
dest_short=${dest:0:8}

sed -i "s/$orig/$dest/g" README.md scripts/* report/*md Portfolio.md 2>&1 >/dev/null
sed -i "s/$orig_short/$dest_short/g" README.md scripts/* report/*md Portfolio.md 2>&1 >/dev/null

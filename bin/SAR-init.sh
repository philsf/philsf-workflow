#!/bin/bash

SAR=${PWD##*/} # local dir
SAR_CODE=${SAR/SAR-/""}

echo "Initializing repository: $SAR"
git init >/dev/null
git add .gitignore README.md "$SAR.Rproj" scripts Portfolio.md report
git commit -m "Initial commit" >/dev/null

# initialize data repo
git init dataset/

# protect data by default
echo "Client dataset made private by default (revert to open data)"
echo "# dataset is private and cannot be publicly versioned
dataset/" >> .gitignore
git add .gitignore
git commit -m "dataset is private and cannot be publicly versioned"

echo "README (en) applied over default (opt-out?)"
cp ~/usr/SAR/README-SAR_en.md README.md

echo "Porfolio (en) applied over default (opt-out?)"
cp ~/usr/SAR/Portfolio_en.md Portfolio.md

echo "Document templates (en) applied over default (opt-out?)"
cp -f ~/usr/SAR/SAP_en.Rmd report/SAP-$SAR_CODE-v01.Rmd
cp -f ~/usr/SAR/SAR_en.Rmd report/SAR-$SAR_CODE-v01.Rmd
cp -a ~/usr/SAR/misc/*en.docx report/misc/
rm -f report/misc/*pt.docx

# update links
SAR-links.sh $SAR_CODE

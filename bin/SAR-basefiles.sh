#!/bin/bash

SAR=${PWD##*/} # local dir
SAR_CODE=${SAR/SAR-/""}

RSCRIPTS="
input.R
describe.R
inference.R
modeling.R
plots.R
results.R
plots-save.R
README-R.md
"
cp ~/usr/SAR/gitignore .gitignore
cp ~/usr/SAR/new-rproj $SAR.Rproj
for r in $RSCRIPTS; do cp ~/usr/SAR/$r scripts/; done

# rename scripts README
mv scripts/README-R.md scripts/README.md

# apply default template repo README
cp ~/usr/SAR/README-SAR_pt.md README.md

# apply default template repo Portfolio
cp ~/usr/SAR/Portfolio_pt.md Portfolio.md

# apply default SAP/SAR templates
cp ~/usr/SAR/SAP_pt.Rmd report/SAP-$SAR_CODE-v01.Rmd
cp ~/usr/SAR/SAR_pt.Rmd report/SAR-$SAR_CODE-v01.Rmd
cp -a ~/usr/SAR/misc/*pt.docx report/misc/

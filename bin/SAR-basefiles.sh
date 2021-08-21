#!/bin/bash

SAR=${PWD##*/} # local dir

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

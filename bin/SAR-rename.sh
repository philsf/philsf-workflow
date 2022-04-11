#!/bin/bash

if [[ "$1" == "" ]]
then
    echo "Usage: SAR-rename.sh SAR_NEW"
    exit
fi

OLD_SAR=${PWD##*/} # local dir
NEW_SAR=$1

echo "Renaming $OLD_SAR to $NEW_SAR"
cd ..
error=$(mv "$OLD_SAR" "$NEW_SAR" 2>&1) || echo "Can't rename repository: $error"
cd "$NEW_SAR" || { echo "Can't enter repository"; exit 1; }

# rename Rstudio project
error=$(git mv "$OLD_SAR.Rproj" "$NEW_SAR.Rproj" 2>&1) || echo "Can't rename RStudio Project: $error"

# rename v01 documents
OLD_SAP_FILE=${OLD_SAR/SAR-/"SAP-"}
NEW_SAP_FILE=${NEW_SAR/SAR-/"SAP-"}

error=$(git mv "report/$OLD_SAP_FILE-v01.Rmd" "report/$NEW_SAP_FILE-v01.Rmd" 2>&1) || echo "Can't rename SAP v01: $error"

error=$(git mv "report/$OLD_SAR-v01.Rmd" "report/$NEW_SAR-v01.Rmd" 2>&1) || echo "Can't rename SAR v01: $error"

echo "Remotes available for updating/renaming:"
for REMOTE in $(git remote)
do
    # SAR-remote-rename.sh $NEW_SAR $REMOTE
    echo "$REMOTE: " $(git remote get-url $REMOTE)
done

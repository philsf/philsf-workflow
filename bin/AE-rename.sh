#!/bin/bash

if [[ "$1" == "" ]]
then
    echo "Uso: AE-rename.sh SAR_NEW"
    exit
fi

OLD_SAR=${PWD##*/} # local dir
NEW_SAR=$1

echo "Renaming $OLD_SAR to $NEW_SAR"
cd ..
error=$(mv "$OLD_SAR" "$NEW_SAR" 2>&1) || echo "Erro ao renomear repositório: $error"
cd "$NEW_SAR" || { echo "Erro ao entrar no repositório"; exit 1; }
error=$(mv "$OLD_SAR.Rproj" "$NEW_SAR.Rproj" 2>&1) || echo "Erro ao renomear RStudio Project: $error"
echo "# $NEW_SAR" > README.md && echo "README atualizado" || echo "Erro ao atualizar README."

echo "Remotos disponíveis para atualização:"
for REMOTE in $(git remote)
do
    # AE-remote-rename.sh $NEW_SAR $REMOTE
    echo "$REMOTE: " $(git remote get-url $REMOTE)
done

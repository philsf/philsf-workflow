#!/bin/bash

if [[ "$1" == "" ]]
then
    echo "Uso: SAR-remote-rename.sh remoto"
    exit
fi

SAR=${PWD##*/} # local dir
REMOTE=$1

REMOTE_OLDPATH=$(git remote get-url "$REMOTE")
REMOTE_DIR=$(dirname "$REMOTE_OLDPATH")
REMOTE_NEWPATH=$REMOTE_DIR/$SAR.git
echo "Renaming remote $REMOTE to $REMOTE_NEWPATH"
error=$(mv "$REMOTE_OLDPATH" "$REMOTE_NEWPATH" 2>&1) || echo "Erro ao renomear o caminho do remoto: $error"
error=$(git remote set-url "$REMOTE" "$REMOTE_NEWPATH" 2>&1) || echo "Erro no git set-url: $error";

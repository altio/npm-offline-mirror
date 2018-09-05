#!/usr/bin/env bash
. $NVM_DIR/nvm.sh
npm set registry http://127.0.0.1:5080
for i in $( ls ~/projects ); do
  echo "copying package.json for $i"
  cp ~/projects/$i/package.json .
  echo "installing packages for $i"
  npm install
  echo "copying package-lock.json into $i"
  cp package-lock.json ~/projects/$i/
  echo "cleaning up package files"
  rm -fr package*
done

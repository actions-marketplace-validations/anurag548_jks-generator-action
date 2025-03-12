#!/bin/sh

set -euo pipefail


createKeyProperties() {

  local FILE_NAME="key.properties"
  
  local KEYSTORE_BASE64="$ANDROID_KEYSTORE_BASE64"

  local KEYSTORE_PASSWORD="$ANDROID_KEYSTORE_PASSWORD"

  local KEY_ALIAS="$ANDROID_KEYSTORE_ALIAS"

  # SAVEIFS=$IFS       # Save current IFS (Internal Field Separator)
  # IFS=$'\n'          # Change IFS to newline char
  # KEYS=($PROPERTY)   # split the `properties` string into an array by the same name
  # IFS=$SAVEIFS       # Restore original IFS
  # IFS=$'\n'          # Change IFS to newline char
  # VALUES=($VALUE)    # split the `properties` string into an array by the same name
  # IFS=$SAVEIFS       # Restore original IFS 

  # for (( i=0; i<${#KEYS[@]}; i++ ))
  # do
  #   echo "KEY $i:${KEYS[$i]}"
  #   echo "VALUE $i:${VALUES[$i]}"
  # done

  echo $KEYSTORE_BASE64 | base64 --decode > "release.jks"

  echo "releaseStorePassword=$KEYSTORE_PASSWORD\nreleaseKeyPassword=$KEYSTORE_PASSWORD\nreleaseKeyAlias=$KEY_ALIAS\nreleaseStoreFile=../release.jks" >> $FILE_NAME
  
  export ANDROID_KEYSTORE_PATH="$GITHUB_WORKSPACE/android/release.jks"
  export ANDROID_KEYSTORE_ALIAS=$ANDROID_KEYSTORE_ALIAS
  export ANDROID_KEYSTORE_PASSWORD=$ANDROID_KEYSTORE_PASSWORD
  export ANDROID_KEYSTORE_PRIVATE_KEY_PASSWORD=$ANDROID_KEYSTORE_PASSWORD

}

createKeyProperties
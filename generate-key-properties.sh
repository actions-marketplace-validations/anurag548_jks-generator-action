#!/bin/sh

set -euo pipefail


createKeyProperties() {

  local FILE_NAME="android/key.properties";
  
  local KEYSTORE_FILE="$ANDROID_KEYSTORE";
  
  local KEY_ALIAS="$ANDROID_KEY_ALIAS";

    
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
  echo "releaseStorePassword=$KEYSTORE_PASSWORD\nreleaseKeyPassword=$KEY_PASSWORD\nreleaseKeyAlias=$KEY_ALIAS\nreleaseStoreFile=$KEYSTORE_FILE" >> $FILE_NAME
}

createKeyProperties
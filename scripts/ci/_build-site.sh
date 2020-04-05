#!/bin/bash

set -e

SCRIPT_DIR=$( dirname "$0" )
if [ -z "$PROJECT_ROOT_PATH" ]; then
  export PROJECT_ROOT_PATH=`cd $SCRIPT_DIR/../.. ; pwd`
fi


bash $SCRIPT_DIR/_print-environment.sh "build-site"


if [[ "$SKIP_GENERATION" == "true" ]]; then
  echo "skipping building..."
else
  echo "building ..."
  bash $SCRIPT_DIR/_adoc-antora.sh $*
  echo "site built in ${SECONDS}s"
fi

# add a marker, that tells github not to use jekyll on the github pages folder
touch ${PROJECT_ROOT_PATH}/antora/target/site/.nojekyll

#!/usr/bin/env bash

export ANTORA_CACHE_DIR=.antora-cache-dir
export ANTORA_TARGET_SITE=antora/target/site

PLAYBOOK_FILE=antora/playbooks/site.yml

while getopts 'ECAKSecaksxyh' opt
do
  case $opt in
    A) export SKIP_CLEAR_CACHE=false
       export SKIP_CLEAR_PREVIOUS=false
       forcing=true ;;
    S) export SKIP_SERVE=false
       forcing=true ;;

    a) export SKIP_GENERATION=true
       export SKIP_CLEAR_CACHE=true
       export SKIP_CLEAR_PREVIOUS=true
      ;;
    s) export SKIP_SERVE=true ;;

    x) export SKIP_CLEAR_CACHE=true ;;
    y) export SKIP_CLEAR_PREVIOUS=true ;;
    h) echo ""
       echo "preview.sh options:"
       echo ""
       echo "  Skip options:"
       echo "  -a skip Antora generation"
       echo "  -s skip serving generated site"
       echo ""
       echo "  Force options (override skip):"
       echo "  -A force Antora generation"
       echo "  -S force serving generated site"
       exit 1
       ;;
    *) echo "unknown option $opt - aborting" >&2
       exit 1
      ;;
  esac
done

if [ "$forcing" = "true" ]; then
    if [ -z "$SKIP_GENERATION" ]; then
      export SKIP_GENERATION=true
      export SKIP_CLEAR_CACHE=true
      export SKIP_CLEAR_PREVIOUS=true
    fi
    if [ -z "$SKIP_SERVE" ]; then
      export SKIP_SERVE=true
    fi
fi

echo ""
echo "SKIP_GENERATION (Antora)   : $SKIP_GENERATION"
echo "SKIP_SERVE                 : $SKIP_SERVE"
echo "SKIP_CLEAR_PREVIOUS (site) : $SKIP_CLEAR_PREVIOUS"
echo "SKIP_CLEAR_CACHE (template): $SKIP_SKIP_CLEAR_CACHE"
echo ""

if [[ "$SKIP_CLEAR_CACHE" == "true" ]]; then
  echo "skipping clearing the Antora cache"
else
  rm -rf $ANTORA_CACHE_DIR
fi

if [[ "$SKIP_CLEAR_PREVIOUS" == "true" ]]; then
  echo "skipping clearing any previous build site"
else
  rm -rf $ANTORA_TARGET_SITE
fi

export ANTORA_CMD=antora

SECONDS=0
echo "\$PLAYBOOK_FILE = $PLAYBOOK_FILE"
sh build-site.sh $PLAYBOOK_FILE || exit 1


if [[ "$SKIP_SERVE" == "true" ]]; then
  echo "skipping serving"
else
  echo ""
  echo "http://localhost:5000"
  echo ""

  serve -S -p 5000 $ANTORA_TARGET_SITE
fi

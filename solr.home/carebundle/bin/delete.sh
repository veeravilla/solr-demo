#!/bin/sh

if [ "$#" -ne 1 ] 
    then
        echo "Usage: delete.sh <path-to-solr>"
        echo "Example: update.sh http://localhost:8983/solr"
        exit 1
fi

curl "$1/carebundle/update?commit=true" --data '<delete><query>*:*</query></delete>' -H 'Content-type:text/xml; charset=utf-8'

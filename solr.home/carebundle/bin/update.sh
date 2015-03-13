#!/bin/sh

if [ "$#" -ne 2 ] 
    then
        echo "Usage: update.sh <path-to-solr> <data-file"
        echo "Example: update.sh http://localhost:8983/solr hce-data-extract.csv"
        exit 1
fi

curl "$1/carebundle/update/csv?f.specialties.split=true&f.specialties.separator=%7C&f.keywords.split=true&f.keywords.separator=%7C&f.conditions.split=true&f.conditions.separator=%7C&f.relatedcarebundle.split=true&f.relatedcarebundle.separator=%7C&commit=true&trim=true" --data-binary @$2 -H 'Content-type:text/csv; charset=utf-8'

#!/bin/bash

USAGE='Usage: this_day event_list'

## VARIABLES
##############################

FILE=$1
TODAY=$( date -I | tail -c 6 )

## ASSERTIONS
##############################

if [ -z "$1" ]; then
  echo "$USAGE"
  exit 1
fi

## MAIN
##############################

# IFS=\n; for l in $( cat "$FILE" ); do
  # echo $l
# done

while read l; do
  date=$( echo "$l" | cut -d'|' -f 1 | tail -c 6 )
  event=$( echo "$l" | cut -d'|' -f 2 )

  if [ "$date" = "$TODAY" ]; then
    echo "Today is ... $event !!"
  fi
done < "$FILE"

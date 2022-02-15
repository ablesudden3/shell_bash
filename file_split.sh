#!/bin/bash
FILENAME=overseas-trade-indexes-June-2021-quarter-provisional-csv.csv
HDR=$(head -1 $FILENAME)
split -l 40000 $FILENAME xyz
n=1
for f in xyz*
do
     if [ $n -gt 1 ]; then
          echo $HDR > CEB$(date +"%Y-%m-%d_%H-%M")_Part-${n}
     fi
     cat $f >> CEB$(date +"%Y-%m-%d_%H-%M")_Part-${n}
     rm $f
     ((n++))
done

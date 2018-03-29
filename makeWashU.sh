#!/bin/bash

if [ $# -lt 3 ];then
    echo "Need  parameters! <baseurl for json file> <genome><bigwig file list(.txt)>"
    exit
fi

source_url=$1 
genome=$2 
bws=$3

samples=($(cat $bws))


out_json="tracks.json"
touch $out_json
printf "[" >$out_json

# adding tracks 
for f in ${samples[@]}
do
    s=${f%.*}
    l=$source_url$f
    sed -e "s@\$url@$l@g;s@\$name@$s@g" $(which base.json) >> $out_json
done


# adding genome 
ref_genome="refGene"
sed -e "s@\$genome@$ref_genome@g" $(which base_genome.json) >> $out_json
printf "]" >> $out_json

# finished
echo "job finished" 
echo "Your tracks can be seen: http://epigenomegateway.wustl.edu/browser/?genome=${genome}&tknamewidth=275&datahub=${source_url}/tracks.json"


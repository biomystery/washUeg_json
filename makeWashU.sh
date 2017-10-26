#!/bin/bash
source_url="http://enhancer.sdsc.edu/sochee/ENCODE/ipstar/"
genome="hg19"

samples=(`curl -s $source_url | grep -o "[a-zA-Z0-9_]*.bw" | uniq`)

out_json="tracks.json"
touch $out_json
echo "[" >$out_json

# adding tracks 
for f in samples
do
    s=${f%.*}
    l=$source_url$f
    sed -e "s@\$url@$l@g;s@\$name@$s@g" base.json |tee -a $out_json
done


# adding genome 
ref_genome="refGene"
sed -e "s@\$genome@$ref_genome@g" base_genome.json |tee -a $out_json
echo "]" >> $out_json

# finished
echo "traks.json generated"



#http://egg.wustl.edu/d/hg19/refGene.gz
#http://egg.wustl.edu/d/hg38/refGene.gz
#http://egg.wustl.edu/d/hg38/gencodeV23.gz
#http://egg.wustl.edu/d/mm10/refGene.gz
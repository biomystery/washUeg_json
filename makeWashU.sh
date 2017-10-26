#!/bin/bash
base_url="http://enhancer.sdsc.edu/sochee/ENCODE/ipstar/"
samples=(`curl -s $base_url| grep -o "[a-zA-Z0-9_]*.bw" | uniq`)

out_json="tracks.json"
touch out_json
echo "[" >$out_json

touch $out_json
for f in samples
do
    s=${f%.*}
    l=$base_url$f
    sed -e "s@\$url@$l@g;s@\$name@$s@g" base.json |tee -a $out_json
done


    






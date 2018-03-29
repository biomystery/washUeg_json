# a tool to generate bw track json for washU epig browser 

## Install 

``` shell
cd [install_dir]
export PATH=$PATH:$(pwd)
chmod u+x makeWashU.sh base.json base_genome.json
```


## Useage 

``` shell
$cd [url_folder_containing_bw]
$ls -1 *.bw > filelist.txt 
$makeWashU.sh [your_url_to_bw_folder] hg38[or hg19 or mm10,...] filelist.txt 

> job finished
> Your tracks can be seen: http://epigenomegateway.wustl.edu/browser/?genome=hg38&tknamewidth=275&datahub=xx/tracks.json

```



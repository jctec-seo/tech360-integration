#-=-=-=-=-=-= init arg -=-=-=-=-=-=
while [ $# -gt 0 ]; do
  case "$1" in
    --url=*)
      url="${1#*=}"
      ;;
    --title=*)
      title="${1#*=}"
      ;;
    *)
      printf "***************************\n"
      printf "* Error: Invalid argument.*\n"
      printf "***************************\n"
      exit 1
  esac
  shift
done

# bash script/url-tech360.sh --url=${url} --title=${title}
# bash script/url-lighthouse.sh --url=${url} --title=${title}
# bash script/url-webpagetest.sh  --url=${url} --title=${title}

# screenshot
projectDir="./seo-projects/${title}/tech360/"
csvFile=`ls ${projectDir}| grep internal.csv`
internalLinkList="./seo-projects/${title}/tech360/${csvFile}"
python3 pythonScript/screenshoot.py --internalLinkList ${internalLinkList} --title ${title} --projectDir ${projectDir}
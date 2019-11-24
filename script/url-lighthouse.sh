#-=-=-=-=-=-= init local.config -=-=-=-=-=-=
source ./script/config.shlib;
echo "$(config_get PROJECT_DIR)";
PROJECT_DIR=$(config_get PROJECT_DIR)

CURRENT_PATH=`pwd`

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

#-=-=-=-=-=-= validate all var -=-=-=-=-=-=
# Check PROJECT_DIR  *******************/
if [ -z ${PROJECT_DIR} ]; then
  echo "[ERROR] null PROJECT_DIR:${PROJECT_DIR}"
  exit 1
fi
printf "[INFO] Argument PROJECT_DIR is: %s\n" "$PROJECT_DIR"
# Check url  *******************/
if [ -z ${url} ]; then
  echo "[ERROR] null url:${url}"
  exit 1
fi
printf "[INFO] Argument url is: %s\n" "$url"
# Check title  *******************/
if [ -z ${title} ]; then
  echo "[ERROR] null title:${title}"
  exit 1
fi
printf "[INFO] Argument title is: %s\n" "$title"
#-=-=-=-=-=-= end validate all var -=-=-=-=-=-=

# lighthouse $url --quiet --chrome-flags="--headless" --verbose --output json html --save-assets  -GA

mkdir ${CURRENT_PATH}/${PROJECT_DIR}/${title}/lighthouse
cd ${CURRENT_PATH}/${PROJECT_DIR}/${title}/lighthouse

# lighthouse $url --quiet --chrome-flags="--headless" --output json html --save-assets  -GA
echo "[INFO] goint to execute : lighthouse $url --quiet --chrome-flags="--headless" --output json html --save-assets  -GA"
lighthouse $url --quiet --chrome-flags="--headless" --output json html --save-assets  -GA

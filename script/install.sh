PROJECT_DIR="seo-projects"
DOWNLOAD_FILE_NAME="mac-techseo360-files.zip"

# -=-=-=-=-=-=--=- techSEO360
echo "[INFO] Going to download zip file: $DOWNLOAD_FILE_NAME"
curl $DOWNLOAD_URL -o $DOWNLOAD_FILE_NAME

echo "[INFO] Going to upzip: $DOWNLOAD_FILE_NAME"
unzip $DOWNLOAD_FILE_NAME -o

echo "[INFO] Going to create dir: $PROJECT_DIR"
mkdir $PROJECT_DIR

# -=-=-=-=-=-=--=- lighthouse
echo "[INFO] Going to install lighthouse"
npm install -g lighthouse

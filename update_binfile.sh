repo="https://github.com/filebrowser/filebrowser"
artifact="linux-armv7-filebrowser.tar.gz"

LATEST_RELEASE=$(curl -L -s -H 'Accept: application/json' "$repo/releases/latest")
# echo $LATEST_RELEASE
# The releases are returned in the format {"id":3622206,"tag_name":"hello-1.0.0.11",...}, we have to extract the tag_name.
LATEST_VERSION=$(echo $LATEST_RELEASE | sed -e 's/.*"tag_name":"\([^"]*\)".*/\1/')
# echo $LATEST_VERSION
[ -e "BINFILE_VERSION" ] && LOCAL_VERSION=`cat BINFILE_VERSION`
if [ -z "${LATEST_VERSION}" ]
then
    echo "connection failed"
    exit 1
fi
if [ "${LATEST_VERSION}" != "${LOCAL_VERSION}" ]
then
    echo "latest \"$LATEST_VERSION\", local \"$LOCAL_VERSION\""
    ARTIFACT_URL="$repo/releases/download/$LATEST_VERSION/$artifact"
    [ -e "$artifact" ] || wget $ARTIFACT_URL
    if [ -e "$artifact" ]
    then
        tar -xf "$artifact"
        ret=$?
        if [ $ret -ne 0 ]; then
            echo "broken file: $artifact"
            rm "$artifact"
            exit 2
        fi
        echo "$LATEST_VERSION" >BINFILE_VERSION
        rm "$artifact"
        echo "successfully update to $LATEST_VERSION"
    else
        echo "download faled"
        exit 3
    fi
else
    echo "local version $LOCAL_VERSION is already up to date"
fi

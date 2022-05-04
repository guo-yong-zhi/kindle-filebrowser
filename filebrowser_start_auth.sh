workdir=$1
if [ "$workdir" == "" ]; then workdir="/mnt/us"; fi
if [ -f ./filebrowser.db ]
then
    METHOD=$(./filebrowser config cat | grep 'Auth method' | awk '{print $3}')
    if [ 'json' != "$METHOD" ]
    then
        ./filebrowser config set --auth.method=json > /dev/null
    fi
fi
./filebrowser -a 0.0.0.0 -p 80 -r "$workdir" > /dev/null
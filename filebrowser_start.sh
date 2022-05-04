workdir=$1
if [ "$workdir" == "" ]; then workdir="/mnt/us"; fi
if [ ! -f ./filebrowser.db ]
then
    ./filebrowser --noauth -a 0.0.0.0 -p 80 -r "$workdir" > /dev/null
else
    METHOD=$(./filebrowser config cat | grep 'Auth method' | awk '{print $3}')
    if [ 'noauth' != "$METHOD" ];
    then
        ./filebrowser config set --auth.method=noauth > /dev/null
    fi
    ./filebrowser -a 0.0.0.0 -p 80 -r "$workdir" > /dev/null
fi
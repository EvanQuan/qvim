#!/bin/bash

target="$1"
echo "target: $target"
# path= get_path $target
# path= "${target%/*}"
# path="${target%/*}"
# basename=$(basename $target)

# echo "path: $path"
# echo "basename: $basename"

pushd "$target" > /dev/null
let count=0
for f in *
do
    path="${target%/*}"
    if [ -d $f ]; then
        echo "$count $path/$f is a DIRECTORY"
    elif [ -f $f ]; then
        echo "$count $path/$f is a FILE"
    else
        echo "$count $path $f is UNKNOWN"
    fi
    let count=count+1
done
echo "hi"
# popd
echo ""
echo "Count: $count"



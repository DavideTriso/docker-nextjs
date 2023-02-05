#!/bin/bash
TAGS=( $(find ./node-* -maxdepth 1 -type d -printf '%f\n') ) 

for tag in "${TAGS[@]}"
do
	echo "  "
    echo "Start build of ${tag} ======================================================================================="
    docker build -t davidetriso/nextjs:${tag} ./${tag}
    echo "Built of ${tag} completed ==================================================================================="
    echo "  "
done

docker push --all-tags davidetriso/nextjs

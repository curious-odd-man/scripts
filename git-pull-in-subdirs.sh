#!/bin/bash

ORIGIN="${1:-origin}"
BRANCH="${2:-}"

pushd . > /dev/null
while IFS= read -r d; do 
    pushd . > /dev/null
	cd "$d/../"
	echo "pulling in `pwd`"
	git pull $ORIGIN $BRANCH
	popd > /dev/null
done < <(find . -name ".git")
popd > /dev/null

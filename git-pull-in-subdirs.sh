#!/bin/bash

ORIGIN="${1:-origin}"
BRANCH="${2:-}"

pushd .
while IFS= read -r d; do 
    pushd .
	cd "$d/../"
	git pull $ORIGIN $BRANCH
	popd
done < <(find . -name ".git")
popd
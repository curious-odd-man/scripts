#!/bin/bash

executable=$@

pushd .
while IFS= read -r d; do 
    pushd .
	cd "$d/../"
	./$executable
	popd
done < <(find . -name ".git")
popd

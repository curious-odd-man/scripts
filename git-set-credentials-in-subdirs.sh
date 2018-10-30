#!/bin/bash

USERNAME=$1
EMAIL=$2

pushd .
while IFS= read -r d; do 
    pushd .
	cd "$d/../"
	git config --local --unset-all user.name
	git config --local --unset-all user.email
	git config --add user.name $USERNAME
	git config --add user.email $EMAIL
	popd
done < <(find . -name ".git")
popd
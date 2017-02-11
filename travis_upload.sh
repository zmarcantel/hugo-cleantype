#!/bin/bash

set -e

PROJECT_OWNER=zmarcantel
PROJECT_NAME=hugo-cleantype
SSH_KEY_TRAVIS_ID=14b1b678a966

STAGING=gh_dist
MASTER_CONTENTS="archetypes layouts static LICENSE.md README.md theme.toml"


if [ "$TRAVIS_BRANCH" = "master" ]; then
    echo "skipping master build..."
    exit 0
fi

eval key=\$encrypted_${SSH_KEY_TRAVIS_ID}_key
eval iv=\$encrypted_${SSH_KEY_TRAVIS_ID}_iv

mkdir -p ~/.ssh
openssl aes-256-cbc -K $key -iv $iv -in upload_key -out ~/.ssh/id_rsa -d
chmod 400 ~/.ssh/id_rsa

# clone the repo and copy off the current commit's (devel branch) author, email, and comment
git clone git@github.com:$PROJECT_OWNER/$PROJECT_NAME $STAGING
AUTHOR=$(git show -n 1 --format="%aN" | head -n 1)
EMAIL=$(git show -n 1 --format="%aE" HEAD | head -n 1)
COMMENT=$(git log -1 --pretty=%B)


# copy the contents we generated
cp -r $MASTER_CONTENTS $STAGING/
cd $STAGING


# copy the git commit author and comment
git config user.name "$AUTHOR"
git config user.email "$EMAIL"

# commit and push
git add --all .
echo "commiting...."
git commit -m "$COMMENT"
echo "pushing..."
git push origin master

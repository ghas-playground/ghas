#!/bin/bash

git_name=$1
git_email=$2
branch_name="add-plotly-dependency"

git config --global user.name "$git_name"
git config --global user.email "$git_email"

git checkout -b $branch_name

echo "django==5.0.7" >> requirements.txt
sort requirements.txt -o requirements.txt

git add requirements.txt
git commit -m "dependencies: add django"
git push origin $branch_name

gh pr create --title "dependencies: add django" --body "This PR adds the django dependency to our project." --base main --head $branch_name

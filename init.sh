#!/bin/bash

slug=""

while [[ $slug == '' || ! $slug =~ [a-z] ]]
do
  read -p "Set project slug (all lowercase alphabet, no whitespace): " slug
done
  echo "Updating config..."
  sed -i '' "s/project-name/$slug/" config.sh
  echo "Updating theme..."
  sed -i '' "s/Template/$slug/" wordpress/wp-content/themes/template/style.css
  mv wordpress/wp-content/themes/template wordpress/wp-content/themes/$slug

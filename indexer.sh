#!/bin/bash

file_start="# "$(basename "$PWD")"\n"

# get all files that are in source control
list=$(git ls-files)

root_files=""
dir_files=""
# create an associative array - required bash@4
declare -A dir_files_list

for filepath in $list
do
  directory_name=$(dirname $filepath)
  file_name=$(basename $filepath)
  extension="${file_name##*.}"

  if [[ $extension == 'md' && $file_name != 'README.md' ]]; then
    file_name="[${file_name%.*}]($filepath)"
    if [[ $directory_name == '.' ]]; then
      root_files+="\n- $file_name"
    else
      dir_files_list[$directory_name]+="- $file_name\n"
    fi
  fi
done

for key in "${!dir_files_list[@]}"; do
  dir_files+="## $key \n\n${dir_files_list[$key]}\n"
done

# write to markdown file
echo -e "$file_start$root_files\n\n$dir_files" > 'README.md'

# check if README changed and commit if it did
readme_changes=$(git diff HEAD README.md)
if [[ ${#readme_changes} == 0 ]]; then
  echo "no changes in file structure"
else
  git add "README.md" && git commit -m "update README"
  echo "changes in file structure, updated README, push again"
  exit 1
fi

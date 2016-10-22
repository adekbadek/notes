#!/bin/bash

file_start="# "$(basename "$PWD")"\n"

# get all files that are in source control
list=$(git ls-files)

root_files=""
dir_files=""
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

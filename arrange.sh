#!/bin/bash

# SWE_2021_41_week_5-main 폴더 안에 있는 files 폴더의 경로
files_folder="./files"

# files 폴더가 존재하는지 확인
if [ ! -d "$files_folder" ]; then
    echo "Error: 'files' folder not found."
    exit 1
fi

# 쓰기 권한을 부여할 알파벳 폴더의 경로
alphabet_folders="./[a-z]"

# 알파벳 폴더에 대한 쓰기 권한 부여
chmod +w $alphabet_folders

# SWE_2021_41_week_5-main 폴더 안에 있는 알파벳 폴더로 파일 이동
for file in "$files_folder"/*; do
    # 파일인지 확인
    if [ -f "$file" ]; then
        # 파일의 첫 글자를 추출하여 알파벳 폴더로 이동
        first_char=$(basename "$file" | cut -c1)
        # 알파벳 폴더를 생성하여 파일 이동
        mv "$file" "./$first_char"
        echo "Moved $(basename "$file") to ./$first_char"
    fi
done

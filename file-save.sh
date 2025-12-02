#!/bin/bash

# 메인 프로그램에서 "저장할 데이터"를 받습니다
DATA=$1

# 데이터가 비어있으면 저장하지 않고 종료합니다
if [ -z "$DATA" ]; then
    echo ">> 저장할 데이터가 없습니다."
    exit 1
fi

# 파일명 입력받기
echo -n ">> 저장할 파일명을 입력하세요: "
read filename

# 파일 저장 수행
echo "$DATA" > "$filename"
echo ">> '$filename' 파일에 저장되었습니다."
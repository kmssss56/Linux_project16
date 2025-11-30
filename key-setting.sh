#!/bin/bash
# 기능 3: 키 설정 모듈

current_key=$1

echo -n ">> Enter new key (number): " >&2
read new_key

if [[ "$new_key" =~ ^[0-9]+$ ]]; then
    echo "$new_key"
else
    echo ">> Error: Not a number." >&2
    echo "$current_key"
fi
#!/bin/bash
# 기능 3: 키 설정 모듈

# 현재 키 값을 받음
current_key=$1

echo -n ">> Enter new key (number): " >&2
read new_key

if [[ "$new_key" =~ ^[0-9]+$ ]]; then
    # 숫자면 새로운 키를 반환
    echo "$new_key"
else
    # 실패하면 에러 메시지 띄우고 원래 키 반환
    echo ">> Error: Not a number." >&2
    echo "$current_key"
fi
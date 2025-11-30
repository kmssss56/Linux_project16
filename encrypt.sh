#!/bin/bash

read -p "text input : " input
output=""

for ((i=0; i<${#input}; i++)); do
    char="${input:$i:1}"
    ascii=$(printf "%d" "'$char")

    if [[ $ascii -ge 65 && $ascii -le 90 ]]; then
        new=$(( (ascii - 65 + 3) % 26 + 65 ))
        output+=$(printf "\\$(printf '%03o' "$new")")
    elif [[ $ascii -ge 97 && $ascii -le 122 ]]; then
        new=$(( (ascii - 97 + 3) % 26 + 97 ))
        output+=$(printf "\\$(printf '%03o' "$new")")
    else
        output+="$char"
    fi
done

echo "text output : $output"

#!/bin/bash

input="$1"
shift=3
output=""

for ((i=0; i<${#input}; i++)); do
    char="${input:$i:1}"

    if [[ "$char" =~ [A-Z] ]]; then
        ascii=$(printf "%d" "'$char")
        dec=$((ascii - shift))
        if (( dec < 65 )); then
            dec=$((dec + 26))
        fi
        output+=$(printf "\\$(printf '%03o' "$dec")")

    elif [[ "$char" =~ [a-z] ]]; then
        ascii=$(printf "%d" "'$char")
        dec=$((ascii - shift))
        if (( dec < 97 )); then
            dec=$((dec + 26))
        fi
        output+=$(printf "\\$(printf '%03o' "$dec")")
    else
        output+="$char"
    fi
done

echo "$output"

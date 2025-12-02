#!/bin/bash
chmod +x encrypt.sh decrypt.sh key-setting.sh file-save.sh 2>/dev/null

KEY=3      
RESULT=""  

show_menu() {
    echo "========================================"
    echo "   시저 사이퍼 암호화/복호화 프로젝트"
    echo "   키 값 : $KEY"
    echo "========================================"
    echo "1. 암호화"
    echo "2. 복호화"
    echo "3. 키 설정"
    echo "4. 파일 관리(세이브/로드)"
    echo "5. Exit"
    echo -n "Select Menu: "
}

while true; do
    show_menu
    read choice
   
    case $choice in
        1)
            read -p ">> Input Text to Encrypt: " input
            output=""
            for ((i=0; i<${#input}; i++)); do
                char="${input:$i:1}"
                ascii=$(printf "%d" "'$char")
                if [[ $ascii -ge 65 && $ascii -le 90 ]]; then
                    new=$(( (ascii - 65 + KEY) % 26 + 65 ))
                    output+=$(printf "\\$(printf '%03o' "$new")")
                elif [[ $ascii -ge 97 && $ascii -le 122 ]]; then
                    new=$(( (ascii - 97 + KEY) % 26 + 97 ))
                    output+=$(printf "\\$(printf '%03o' "$new")")
                else
                    output+="$char"
                fi
            done
            RESULT="$output"
            echo ">> Encrypt Result : $RESULT"
            ;;
        2)
            read -p ">> Input Text to Decrypt: " input
            shift=$KEY
            output=""
            for ((i=0; i<${#input}; i++)); do
                char="${input:$i:1}"
                if [[ "$char" =~ [A-Z] ]]; then
                    ascii=$(printf "%d" "'$char")
                    dec=$((ascii - shift))
                    if (( dec < 65 )); then dec=$((dec + 26)); fi
                    output+=$(printf "\\$(printf '%03o' "$dec")")
                elif [[ "$char" =~ [a-z] ]]; then
                    ascii=$(printf "%d" "'$char")
                    dec=$((ascii - shift))
                    if (( dec < 97 )); then dec=$((dec + 26)); fi
                    output+=$(printf "\\$(printf '%03o' "$dec")")
                else
                    output+="$char"
                fi
            done
            RESULT="$output"
            echo ">> Decrypt Result : $RESULT"
            ;;
        3)
            echo -n ">> Enter new key (number): "
            read new_key
            if [[ "$new_key" =~ ^[0-9]+$ ]]; then
                KEY=$new_key
                echo ">> Key changed to [$KEY]."
            else
                echo ">> Error: Not a number."
            fi
            ;;
        4)
            echo " [1] Save Result  [2] Load File"
            echo -n " Select: "
            read f_choice
            if [ "$f_choice" == "1" ]; then
                if [ -z "$RESULT" ]; then
                    echo ">> No result to save!"
                else
                    echo -n ">> Filename: "
                    read fname
                    echo "$RESULT" > "$fname"
                    echo ">> Saved to '$fname'."
                fi
            elif [ "$f_choice" == "2" ]; then
                echo -n ">> Filename: "
                read fname
                if [ -f "$fname" ]; then
                    echo ">> Content:"
                    cat "$fname"
                    echo ""
                else
                    echo ">> Error: File not found."
                fi
            fi
            ;;
        5) echo "Bye!"; exit 0 ;;
        *) echo "Invalid input." ;;
    esac
    echo ""
done

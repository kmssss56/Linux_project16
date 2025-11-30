#!/bin/bash
# ---------------------------------------------------------
# [Team 14] Linux Project
# 202201445 강민서 (기능 3,4) / 202302902 박성수 (기능 1,2)
# ---------------------------------------------------------

KEY=3       # 기본 암호화 키
RESULT=""   # 결과 값 (암호화된 문자열을 담을 변수)

# 메뉴 출력
show_menu() {
    echo "========================================"
    echo "   🔐 Caesar Cipher Tool (Team 14)"
    echo "   Current Key: $KEY"
    echo "========================================"
    echo "1. Encrypt Text (박성수)"
    echo "2. Decrypt Text (박성수)"
    echo "3. Set Key (강민서)"
    echo "4. Save/Load Result (강민서)"
    echo "5. Exit"
    echo -n "Select Menu: "
}

while true; do
    show_menu
    read choice
    
    case $choice in
        1) 
            echo ">> [구현 예정] 암호화 기능은 박성수님이 작업 중입니다." 
            # 테스트를 위해 임시 값 넣어둠 (통합 시 삭제)
            RESULT="Encrypted_Text_Sample"
            ;;
        2) 
            echo ">> [구현 예정] 복호화 기능은 박성수님이 작업 중입니다." 
            ;;
        3) 
            # [기능 3] 암호화 키 설정 (구현 완료)
            echo -n ">> Enter new key (number): "
            read new_key
            if [[ "$new_key" =~ ^[0-9]+$ ]]; then
                KEY=$new_key
                echo ">> Key changed to [$KEY]."
            else
                echo ">> Error: Please enter a valid number."
            fi
            ;;
        4) 
            # [기능 4] 파일 저장 및 불러오기 (오늘 구현 완료!)
            echo "-----------------------------"
            echo " 1) Save Result to File"
            echo " 2) Load Result from File"
            echo "-----------------------------"
            echo -n "Select: "
            read file_choice
            
            if [ "$file_choice" == "1" ]; then
                if [ -z "$RESULT" ]; then
                    echo ">> No result to save! Run Encrypt first."
                else
                    echo -n ">> Enter filename (e.g., out.txt): "
                    read fname
                    echo "$RESULT" > "$fname"
                    echo ">> Saved to '$fname'."
                fi
            elif [ "$file_choice" == "2" ]; then
                echo -n ">> Enter filename to load: "
                read fname
                if [ -f "$fname" ]; then
                    echo ">> Loading content from '$fname':"
                    cat "$fname"
                    echo ""
                else
                    echo ">> Error: File not found."
                fi
            else
                echo ">> Invalid selection."
            fi
            ;;
        5) 
            echo "Bye!"
            exit 0 
            ;;
        *) 
            echo "Invalid input." 
            ;;
    esac
    echo ""
done
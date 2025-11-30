#!/bin/bash
# ---------------------------------------------------------
# [Team 14] Linux Project
# 202201445 강민서 (기능 3,4) / 202302902 박성수 (기능 1,2)
# ---------------------------------------------------------

KEY=3       # 기본 암호화 키
RESULT=""   # 결과 값

# 메뉴 출력
show_menu() {
    echo "========================================"
    echo "   🔐 Caesar Cipher Tool (Team 14)"
    echo "   Current Key: $KEY"
    echo "========================================"
    echo "1. Encrypt Text (박성수)"
    echo "2. Decrypt Text (박성수)"
    echo "3. Set Key (강민서)"
    echo "4. Save Result (강민서)"
    echo "5. Exit"
    echo -n "Select Menu: "
}

while true; do
    show_menu
    read choice
    
    case $choice in
        1) 
            echo ">> [구현 예정] 암호화 기능은 박성수님이 작업 중입니다." 
            ;;
        2) 
            echo ">> [구현 예정] 복호화 기능은 박성수님이 작업 중입니다." 
            ;;
        3) 
            # [기능 3] 암호화 키 설정 (오늘 구현 완료!)
            echo -n ">> Enter new key (number): "
            read new_key
            # 숫자인지 확인
            if [[ "$new_key" =~ ^[0-9]+$ ]]; then
                KEY=$new_key
                echo ">> Key changed to [$KEY]."
            else
                echo ">> Error: Please enter a valid number."
            fi
            ;;
        4) 
            # [기능 4] 파일 저장은 내일(월요일) 구현 예정
            echo ">> [구현 중] 파일 저장 기능은 개발 중입니다..."
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
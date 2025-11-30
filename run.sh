#!/bin/bash

KEY=3
RESULT=""

chmod +x encrypt.sh decrypt.sh key-setting.sh file-save.sh 2>/dev/null

show_menu() {
    echo "=============================="
    echo " Caesar Cipher Tool (Team 14)"
    echo " Current Key: $KEY"
    echo "=============================="
    echo "1. Encrypt"
    echo "2. Decrypt"
    echo "3. Set Key"
    echo "4. Save Result"
    echo "5. Exit"
    echo -n "Select: "
}

while true; do
    show_menu
    read menu

    case $menu in
        1)
            RESULT=$(bash encrypt.sh "$KEY")
            echo ">> Output: $RESULT"
            ;;
        2)
            RESULT=$(bash decrypt.sh "$KEY")
            echo ">> Output: $RESULT"
            ;;
        3)
            KEY=$(bash key.sh "$KEY")
            ;;
        4)
            bash save.sh "$RESULT"
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
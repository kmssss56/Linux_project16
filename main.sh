#!/bin/bash
# [Team 14] Initial Skeleton Code

KEY=3

show_menu() {
    echo "=== Team 14 Project ==="
    echo "1. Encrypt (박성수)"
    echo "2. Decrypt (박성수)"
    echo "3. Set Key (강민서)"
    echo "4. Save File (강민서)"
    echo "5. Exit"
    echo -n "Select: "
}

while true; do
    show_menu
    read choice
    case $choice in
        1) echo "Not implemented yet." ;;
        2) echo "Not implemented yet." ;;
        3) echo "Not implemented yet." ;;
        4) echo "Not implemented yet." ;;
        5) exit 0 ;;
        *) echo "Invalid." ;;
    esac
    echo ""
done
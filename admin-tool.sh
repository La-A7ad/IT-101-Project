#!/bin/bash

# Function to display the main menu
show_main_menu() {
    while true; do
        clear
        echo "System Administration Menu"
        echo "--------------------------"
        echo "1) User Management"
        echo "2) Show current number of users logged in"
        echo "3) Show info about system"
        echo "4) Show all available shells"
        echo "5) Show mouse settings (xinput)"
        echo "6) Show CPU info"
        echo "7) Show memory info"
        echo "8) Show hard disk info"
        echo "9) Show mounted file systems"
        echo "10) Exit"
        echo "--------------------------"
        echo -n "Enter your choice [1-10]: "
        read choice

        if [ "$choice" -eq 1 ]; then
            user_management_menu
        elif [ "$choice" -eq 2 ]; then
            show_logged_in_users
        elif [ "$choice" -eq 3 ]; then
            show_system_info
        elif [ "$choice" -eq 4 ]; then
            echo"$(cat /etc/shells)"
        elif [ "$choice" -eq 5 ]; then
            echo"$(xinput --list)"
        elif [ "$choice" -eq 6 ]; then
            echo"$(cat /proc/cpuinfo)"
        elif [ "$choice" -eq 7 ]; then
            echo"$(free -h)"
        elif [ "$choice" -eq 8 ]; then
            echo"$(lsblk)"
        elif [ "$choice" -eq 9 ]; then
            echo"$(df -h)"
        elif [ "$choice" -eq 10 ]; then
            exit 0
        else
            echo "Invalid option"
            pause
        fi
    done
}

# Function to display the user management menu
user_management_menu() {
    while true; do
        clear
        echo "User Management Menu"
        echo "--------------------"
        echo "1) Add User"
        echo "2) Modify User"
        echo "3) Delete User"
        echo "4) Return to Main Menu"
        echo "--------------------"
        echo -n "Enter your choice [1-4]: "
        read um_choice

        if [ "$um_choice" -eq 1 ]; then
            add_user
        elif [ "$um_choice" -eq 2 ]; then
            modify_user
        elif [ "$um_choice" -eq 3 ]; then
            delete_user
        elif [ "$um_choice" -eq 4 ]; then
            break  # This will exit the loop and return to the main menu
        else
            echo "Invalid option"
            pause
        fi
    done
}

# Function implementations for adding, modifying, and deleting users

# Function to add a new user
add_user() {
    echo -n "Enter username: "
    read username
    sudo adduser $username
    pause
}

# Function to modify an existing user
modify_user() {
    echo -n "Enter username: "
    read username
    echo "Options: --username [new username] --comment [new comment] --home [new home dir]"
    echo "         --gid [new primary group] --groups [new groups] --shell [new shell]"
    echo "         --expiredate [YYYY-MM-DD] --lock --unlock"
    echo -n "Enter option and value: "
    read options
    sudo usermod $options $username
    pause
}

# Function to delete a user
delete_user() {
    echo -n "Enter username to delete: "
    read username
    sudo deluser $username
    pause
}

# Function to pause the screen
pause() {
    echo "Press any key to continue..."
    read -p "$*"
}

# Function to show number of users logged in
show_logged_in_users() {
    who | wc -l
    pause
}

# Function to show system information
show_system_info() {
    uname -a
    pause
}

# Main program starts here
show_main_menu

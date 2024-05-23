#!/bin/bash

# Function to pause and prompt user to press any key to continue
pause() {
    echo "Press any key to continue..."
    read -p "$*"
}

# Function to show the number of users currently logged in
show_logged_in_users() {
    echo "Current number of users logged in:"
    who | wc -l
    pause
}

# Function to display system information
show_system_info() {
    echo "System Information:"
    uname -a
    pause
}

# Function to display all available shells
show_available_shells() {
    echo "Available shells:"
    cat /etc/shells
    pause
}

# Function to display mouse settings using xinput
show_mouse_settings() {
    echo "Mouse settings:"
    xinput --list
    pause
}

# Function to display CPU information
show_cpu_info() {
    echo "CPU Information:"
    cat /proc/cpuinfo
    pause
}

# Function to display memory information
show_memory_info() {
    echo "Memory Information:"
    free -h
    pause
}

# Function to display hard disk information
show_hard_disk_info() {
    echo "Hard Disk Information:"
    lsblk
    pause
}

# Function to display mounted file systems
show_mounted_file_systems() {
    echo "Mounted File Systems:"
    df -h
    pause
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
            break  # Exit the loop and return to main menu
        else
            echo "Invalid option"
            pause
        fi
    done
}

# Function to add a new user
add_user() {
    echo -n "Enter username: "
    read username
    echo $(sudo adduser $username)
    pause
}

# Function to modify an existing user
modify_user() {
    echo -n "Enter username: "
    read username
    echo "Enter options and values (e.g., --comment 'new comment'):"
    read options
    echo $(sudo usermod $options $username)
    pause
}

# Function to delete a user
delete_user() {
    echo -n "Enter username to delete: "
    read username
    echo $(sudo deluser $username)
    pause
}

# Function to display the main menu and handle navigation
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
            show_available_shells
        elif [ "$choice" -eq 5 ]; then
            show_mouse_settings
        elif [ "$choice" -eq 6 ]; then
            show_cpu_info
        elif [ "$choice" -eq 7 ]; then
            show_memory_info
        elif [ "$choice" -eq 8 ]; then
            show_hard_disk_info
        elif [ "$choice" -eq 9 ]; then
            show_mounted_file_systems
        elif [ "$choice" -eq 10 ]; then
            exit 0
        else
            echo "Invalid option"
            pause
        fi
    done
}

# Start the main menu
show_main_menu

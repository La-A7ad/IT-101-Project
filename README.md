
# System Administration Tool

This Bash script provides a comprehensive tool for managing system administration tasks on Linux. It offers a user-friendly, menu-driven interface to perform various tasks, including user management, system monitoring, and more.

## Features

- **User Management**: Function for adding, modifying or deleting users
- **System Information**: Display current system information including CPU, memory, and disk usage
- **Device Information**: View details on input devices and available shells
- **Storage Information**: Monitor mounted file systems and hard disk usage
- **User Activity**: Check the number of currently logged-in users

## Dependencies
- `xinput` installed for viewing mouse settings (install via your package manager if not present) 

For Arch users:

```sudo pacman -S xorg-xinput```

For Ubuntu users:

```sudo apt install xinput```

## Installation

Just download the script then do:

```bash chmod +x admin_tool.sh```

then 

```bash admin_tool.sh```

## Menu Options

1. **User Management**: Navigate to a submenu for adding, modifying, or deleting users
2. **Show Current Number of Users Logged In**: Displays the number of users currently logged into the system
3. **Show Info About System**: Provides general information about the system such as kernel version and architecture
4. **Show All Available Shells**: Lists all shells available on the system
5. **Show Mouse Settings**: Displays current mouse device settings using `xinput`
6. **Show CPU Info**: Shows detailed information about the CPU
7. **Show Memory Info**: Provides a summary of current memory usage
8. **Show Hard Disk Info**: Lists all storage devices and their partitions
9. **Show Mounted File Systems**: Displays all currently mounted file systems and their usage
10. **Exit**: Closes the application.

## Notes

- Ensure that you run the script with sufficient permissions, especially for tasks that modify system settings or user information.

- The script is designed for informational and administrative purposes and should be used with caution to avoid accidental system changes.


# Terminal History Cleaner (Zsh)

A small Bash script to clear the current shell history and wipe the .zsh_history file on Kali Linux or any Zsh-based system.

Useful for:

* Privacy cleanup.

* Lab environments.

* Malware analysis / forensics testing.

* Shared or temporary systems.


# What This Script Does

* Clears the current session’s command history.

* Empties the .zsh_history file.

* Prevents the shell from saving new history.

* Clears the terminal screen.

* Displays a confirmation message.


# Script Breakdown
```bash
history -c
```
Clears the command history of the current shell session.
```bash
/home/kali/.zsh_history
```
Overwrites the Zsh history file with an empty file.
```bash
unset HISTFILE
```
Prevents the shell from writing any further history.
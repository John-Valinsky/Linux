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
```bash
clear
```
Clears the terminal screen.


# Usage

Make the script executable:
```bash
chmod +x clear_history.sh
```
Run the script:
```bash
./clear_history.sh
```


# Important Notes

* This script is Zsh-specific (.zsh_history).

* Path is hardcoded for the kali user.

* History deletion is irreversible.

* Run only if you fully understand the implications.


# Customization

For other users, update the path:
```bash
/home/USERNAME/.zsh_history
```
To support Bash:
```bash
~/.bash_history
```


# Ethical Use

This script is intended for:

* Personal privacy

* Training labs

* System cleanup

* Digital forensics research

Do not use to hide malicious or illegal activity.


# License

MIT License

Copyright (c) 2026 John Valinsky

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files, to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
# Utility
alias full_update='sudo apt-get update && sudo apt-get upgrade'
alias full_upgrade='full_update'
alias update='sudo apt update'
alias upgrade='sudo apt upgrade'
alias network-manager='echo Its nmcli, idiot.'
alias whoowns="stat -c '%U'"

export ORIGPATH=$PATH
alias localpath="export PATH=$PATH:$(pwd)"
alias resetpath="export PATH=$ORIGPATH"


# Fun
alias would_you_kindly='sudo'
alias please='sudo'
alias just_fucking='sudo'
alias this='python3 -m this'
alias whoami='echo "You tell me..." && echo "" && who'
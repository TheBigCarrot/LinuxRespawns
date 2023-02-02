# This is a bash script that installs all the basic essentials for my Mint machines

# Move to home dir and make sure git and pip are installed
cd ~
sudo apt install python3-pip -y
sudo apt install git -y

# Sublime Text install
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt update
sudo apt install sublime-text

# Make a tools dir and download linpeas
mkdir Tools && cd Tools
wget https://github.com/carlospolop/PEASS-ng/releases/download/20230129/linpeas.sh

# Go back to home dir
cd ~

# Make a Wordlist dir and download my wordlists
wget https://github.com/praetorian-inc/Hob0Rules/raw/master/wordlists/rockyou.txt.gz
gunzip rockyou.txt.gz
wget https://github.com/daviddias/node-dirbuster/raw/master/lists/directory-list-2.3-medium.txt

# Install gobuster
sudo apt install gobuster

# Install metasploit
curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall && chmod 755 msfinstall && ./msfinstall

# Update and Upgrade everything
sudo apt update && sudo apt upgrade
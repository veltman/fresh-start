# Ubuntu 14.04
# Updated February 3, 2015

#!/bin/bash

# Move into home directory
cd ~/
 
# Add QGIS repo
sudo add-apt-repository -s "deb http://qgis.org/debian trusty main"

# Add TileMill repo
sudo add-apt-repository ppa:developmentseed/mapbox
 
# Update/upgrade
sudo apt-get update && sudo apt-get upgrade
 
# Install Node, VLC, Git, Gimp, Pip, Ruby, QGIS, GRASS, PostgreSQL, TileMill, Chromium
# npm comes with nodejs package now
# force-yes because QGIS repo is untrusted
sudo apt-get --yes --force-yes install nodejs vlc browser-plugin-vlc git gimp \
python-pip qgis python-qgis qgis-plugin-grass postgresql \
postgresql-contrib tilemill libmapnik chromium-browser ruby

# Install AWS CLI tools and virtualenv
sudo pip install awscli virtualenv

# Configure Postgres
sudo -u postgres createuser --superuser $USER
sudo apt-get install postgis osm2pgsql
 
# Install Sublime Text 2
wget http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%202.0.2%20x64.tar.bz2
tar vxjf Sublime\ Text\ 2.0.2\ x64.tar.bz2
sudo mv Sublime\ Text\ 2 /opt/
sudo ln -s /opt/Sublime\ Text\ 2/sublime_text /usr/bin/sublime
rm Sublime\ Text\ 2.0.2\ x64.tar.bz2

# Basic Unity config for Sublime (add this to a repo)
sudo wget -O /usr/share/applications/sublime.desktop https://gist.githubusercontent.com/veltman/f17943b9c638ff0b4308/raw/gistfile1.txt
 
# Set Sublime as default editor
sudo sed -i 's@gedit.desktop@sublime.desktop@g' /usr/share/applications/defaults.list

# Configure git
git config --global user.name "Noah"
git config --global user.email "noah@noahveltman.com"
git config --global push.default current

# Fix privacy
wget -q -O - https://fixubuntu.com/fixubuntu.sh | bash
 
# Create projects folder and server
mkdir ~/projects
cd ~/projects/
npm install express serve-index
sudo npm install forever -g
#  (add this to a repo)
wget -O ~/projects/server.js https://gist.githubusercontent.com/veltman/bb4432b68cf82b957fbf/raw/gistfile1.txt
sudo forever start ~/projects/server.js
sudo chmod a+w /etc/rc.local
sudo sed -i '$d' /etc/rc.local
echo "forever start ~/projects/server.js" >> /etc/rc.local
echo "exit 0" >> /etc/rc.local
sudo chmod 755 /etc/rc.local

# Set desired launcher icons
gsettings set com.canonical.Unity.Launcher favorites \
"['application://nautilus.desktop', 'application://chromium-browser.desktop', 'application://sublime.desktop', 'application://gnome-terminal.desktop', 'application://firefox.desktop', 'application://ubuntu-software-center.desktop', 'application://unity-control-center.desktop', 'unity://running-apps', 'unity://expo-icon', 'unity://devices']"

# Add ~/projects to bookmarks
echo "file:///home/$USER/projects" >> ~/.config/gtk-3.0/bookmarks

# Add git aliases (make this a dotfile for download later)
echo "alias pull='git pull'" >> ~/.bash_aliases
echo "alias push='git push'" >> ~/.bash_aliases
echo "alias commit='git commit -am'" >> ~/.bash_aliases

# To dos
## Add dotfile repo for aliases and other settings
## Add Sublime config file
## Manage private key and AWS credentials
## Install Spotify Experimental
## MySQL?
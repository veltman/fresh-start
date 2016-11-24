#!/bin/bash

# Ubuntu 16.04

# Stop on error
set -e

# Set some custom variables
GIT_USER_NAME=Noah
GIT_USER_EMAIL=noah@noahveltman.com

# Update/upgrade
sudo apt-get update && sudo apt-get upgrade

# Install Node, NPM, VLC, Git, Gimp, Pip, Ruby, PostgreSQL, Chromium
sudo apt-get install --yes nodejs npm vlc browser-plugin-vlc git gimp \
python-pip chromium-browser ruby postgresql postgresql-contrib python-gpgme

# Install QGIS
# Per https://www.qgis.org/en/site/forusers/alldownloads.html
sudo add-apt-repository -s "deb http://qgis.org/debian xenial main"
sudo apt-get update
sudo apt-get install --yes --force-yes qgis python-qgis qgis-plugin-grass

# Install AWS CLI tools and virtualenv
sudo pip install --upgrade pip
sudo pip install awscli virtualenv

# Configure Postgres
sudo -u postgres createuser --superuser $USER
sudo apt-get install postgis osm2pgsql

# Install Atom
wget -O atom-amd64.deb https://atom.io/download/deb
sudo dpkg --install atom-amd64.deb
rm atom-amd64.deb

# Install oh-my-zsh
# Per https://github.com/robbyrussell/oh-my-zsh
sudo apt-get install --yes zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# Fix Node legacy nonsense
sudo ln -s /usr/bin/nodejs /usr/bin/node

# Basic HTTP server
sudo npm install http-server -g

# Set Atom as default editor
sudo sed -i 's@gedit.desktop@atom.desktop@g' /usr/share/applications/defaults.list

# Configure git
git config --global user.name $GIT_USER_NAME
git config --global user.email $GIT_USER_EMAIL
git config --global push.default current

# Copy aliases
cp .bash_aliases ~/

# Install Spotify
# Per https://www.spotify.com/us/download/linux/
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update
sudo apt-get install spotify-client

# Turn off online searching in Dash
gsettings set com.canonical.Unity.Lenses remote-content-search none

# Set desired launcher icons
gsettings set com.canonical.Unity.Launcher favorites \
"['application://org.gnome.Nautilus.desktop', 'application://chromium-browser.desktop', 'application://atom.desktop', 'application://gnome-terminal.desktop', 'application://qgis.desktop', 'application://spotify.desktop', 'application://firefox.desktop', 'application://org.gnome.Software.desktop', 'application://unity-control-center.desktop', 'unity://running-apps', 'unity://expo-icon', 'unity://devices']"

# Create projects folder and server
mkdir ~/projects/

# Add ~/projects to bookmarks
echo "file:///home/$USER/projects" >> ~/.config/gtk-3.0/bookmarks

# To dos
## Credentials - SSH key, AWS config
## oh-my-zsh config
## Start http-server on projects folder on port 80 at startup?
## Dropbox?
## MySQL?

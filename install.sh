#!/bin/bash

# Ubuntu 15.04
# Updated October 4, 2015

# Stop on error
set -e

# Set some custom variables
GIT_USER_NAME=Noah
GIT_USER_EMAIL=noah@noahveltman.com

# Add QGIS repo
sudo add-apt-repository -s "deb http://qgis.org/debian trusty main"

# Update/upgrade
sudo apt-get update && sudo apt-get upgrade

# Install Node, NPM, VLC, Git, Gimp, Pip, Ruby, QGIS, GRASS, PostgreSQL, TileMill, Chromium
# npm comes with nodejs package now
# force-yes because QGIS repo is untrusted
sudo apt-get --yes --force-yes install nodejs npm vlc browser-plugin-vlc git gimp \
python-pip qgis python-qgis qgis-plugin-grass postgresql \
postgresql-contrib chromium-browser ruby

# Install AWS CLI tools and virtualenv
sudo pip install awscli virtualenv

# Configure Postgres
sudo -u postgres createuser --superuser $USER
sudo apt-get install postgis osm2pgsql

# Install Atom
wget https://github.com/atom/atom/releases/download/v1.0.19/atom-amd64.deb
sudo dpkg --install atom-amd64.deb
rm atom-amd64.deb

# 1PasswordAnywhere via Dropbox using the `1pass` command
# Configure this to set up the `1pass` alias
# Basic HTTP server for
sudo npm install http-server -g


# Set Atom as default editor
sudo sed -i 's@gedit.desktop@atom.desktop@g' /usr/share/applications/defaults.list

# Fix Node
sudo ln -s /usr/bin/nodejs /usr/bin/node

# Configure git
git config --global user.name $GIT_USER_NAME
git config --global user.email $GIT_USER_EMAIL
git config --global push.default current

# Copy aliases
cp .bash_aliases ~/

# Install Spotify
# This doesn't work right now because of a libgcrypt update in 15.04,
# so you have to install the test version, but that'll probably be fixed
# soon so I'm leaving this code
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys D2C19886
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update
sudo apt-get --yes install spotify-client

# Turn off online searching in Dash
gsettings set com.canonical.Unity.Lenses remote-content-search none

# Set desired launcher icons
gsettings set com.canonical.Unity.Launcher favorites \
"['application://nautilus.desktop', 'application://chromium-browser.desktop', 'application://atom.desktop', 'application://gnome-terminal.desktop', 'application://firefox.desktop', 'application://spotify.desktop', 'application://ubuntu-software-center.desktop', 'application://unity-control-center.desktop', 'unity://running-apps', 'unity://expo-icon', 'unity://devices']"

# Create projects folder and server
mkdir ~/projects/

# Add ~/projects to bookmarks
echo "file:///home/$USER/projects" >> ~/.config/gtk-3.0/bookmarks

# To dos
## Start http-server on projects folder on port 80 at startup
## Private key and AWS configuration file
## Dropbox
## MySQL?

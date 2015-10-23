# Fresh Start

A full bootstrap script for a new installation of Ubuntu Desktop 15.04.

Installs:

* Node.js
* VLC
* Gimp
* PIP
* Ruby
* QGIS
* GRASS
* PostgreSQL
* Chromium
* Spotify
* AWS CLI tools
* virtualenv
* Atom
* Static webserver

Configures:

* Git
* Privacy settings (turns off automatic remote searching)
* Launcher icons
* Bookmarks

Customize the git user name and email in `install.sh` to your own.

If you want to use 1Password, configure the path to your 1Password keys in `.bash_aliases`.  If they're on Dropbox, you'll also need to [manually install Dropbox](https://www.dropbox.com/install?os=lnx).

As of October 23, 2015, there is a bug when running the current stable version of Spotify on 15.04, but it's fixed in the current [test version](http://repository-origin.spotify.com/pool/non-free/s/spotify-client/).  I'm leaving the original Spotify code in the install script because it will probably be fixed in the stable version soonish.

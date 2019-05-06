#!/bin/sh

su - cec
##password
sudo apt-get update  ##update is used to download package information from all configured sources.
sudo apt-get upgrade ##is used to install available upgrades of all packages
           currently installed on the system from the sources configured via
           sources.list(5)
sudo apt search <package name>
dpkg -s <package> ##Checks the status of the package. Whether installed or not.
sudo apt-get install <package name>
sudo apt remove <package>

#!/usr/local/bin/zsh

## This script configures a range of settings for OS X
## and has been tested on OS X 10.11.1 (El Capitan)

echo "Disable transparency on menu bar and dock"
defaults write com.apple.universalaccess reduceTransparency -bool true

echo "Enable debug and developer menu's in Safari"
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

echo "Make TextEdit default to text files"
defaults write com.apple.TextEdit RichText -int 0

echo "Finder tweaks"
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write com.apple.finder CreateDesktop -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.PowerChime ChimeOnAllHardware -bool true
open /System/Library/CoreServices/PowerChime.app

echo "Set keyboard key repeat settings and speed"
defaults write -g ApplePressAndHoldEnabled -bool false
defaults write NSGlobalDomain KeyRepeat -int 0.02

echo "Expand printer dialog box"
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

echo "Disable notification centre"
launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist

echo "Set screen capture settings"
defaults write com.apple.screencapture location ~/Desktop
defaults write com.apple.screencapture type -string "png"
defaults write com.apple.screencapture disable-shadow -bool true

echo "Set software update frequency to daily"
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

echo "Disable startup sound"
sudo nvram SystemAudioVolume=" "

echo "Set timemachine backup to every half hour"
sudo defaults write /System/Library/Launch Daemons/com.apple.backupd-auto StartInterval -int 1800

echo "Disable hard drive protection (we have an SSD)"
sudo pmset -a sms 0

echo "Disable and remove Remote Desktop settings"
sudo rm -rf /var/db/RemoteManagement 
sudo defaults delete /Library/Preferences/com.apple.RemoteDesktop.plist 
defaults delete ~/Library/Preferences/com.apple.RemoteDesktop.plist 
sudo rm -r /Library/Application\ Support/Apple/Remote\ Desktop/ 
rm -r ~/Library/Application\ Support/Remote\ Desktop/ 
rm -r ~/Library/Containers/com.apple.RemoteDesktop

echo "Unhide user ~/library folder"
chflags nohidden ~/Library

echo "Disable .DS_Store files on USB and network drives"
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Apply UI settings now
echo "Restart desktp services"
killall SystemUIServer
killall Finder
killall -9 NotificationCenter

# Shutdown and restart
# echo "Restarting computer"
sudo reboot

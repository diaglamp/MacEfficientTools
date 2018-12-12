# Disable guest account (unused, comment)
# sudo bash install-steps/guest_account.sh disable

# Use F1-F12 as standard function keys
defaults write -globalDomain com.apple.keyboard.fnState -int 1

# Enable full keyboard access for all controls, Tab to select option
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Auto hide and show Dock. Speed Up Animations
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0.05
defaults write com.apple.dock expose-animation-duration -float 0.12

# Hide some app icons in Dock and make dock lays left
clang -framework Foundation tools/DockIconHider_source.m -o DockIconHider
./DockIconHider
rm ./DockIconHider

# Show battery percentage
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

# Optimize window resize speed
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

# Config Finder
# defaults write com.apple.finder CreateDesktop false
defaults write com.apple.finder QLEnableTextSelection -boolean true
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -boolean false
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -boolean false
defaults write com.apple.finder FXEnableExtensionChangeWarning -boolean false
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Enable clickpad Tap to click
defaults write com.apple.AppleMultitouchTrackpad Clicking -int 1
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
[ -e ~/Library/Application\ Support/Dock/*.db ] && rm ~/Library/Application\ Support/Dock/*.db

# Enable three finger to drag (三指上下左右滑动都有冲突手势, comment)
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true
# defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true

# Show the ~/Library Directory
chflags nohidden ~/Library

# disable spotlight (unnecessary, comment, todo: change or disable shortcut)
# sudo chmod 600 /System/Library/CoreServices/Search.bundle/Contents/MacOS/Search

# Config menu bar
defaults write com.apple.Siri StatusMenuVisible -bool false
defaults write com.apple.Siri UserHasDeclinedEnable -bool true
# cp config/com.apple.systemuiserver.plist ~/Library/Preferences/
# Disable menu bar transparency
defaults write NSGlobalDomain AppleEnableMenuBarTransparency -bool false

# Skip image verify (Unused, Comment)
# defaults write com.apple.frameworks.diskimages skip-verify -bool true
# defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
# defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

# Disable app verifying
sudo spctl --master-disable
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Disable text auto correct
defaults write -g NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write -g NSAutomaticDashSubstitutionEnabled -bool false
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false

# Make configurations works
for app in Finder Dock Mail SystemUIServer; do killall "$app" >/dev/null 2>&1; done
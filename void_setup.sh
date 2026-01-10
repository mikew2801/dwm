# Initial Void setup
# Run this, then use emacs to set up the rest

# Install the most basic applications
xbps-install -u xbps
xbps-install -Suv
xbps-install void-repo-nonfree neovim engrampa zip unzip emacs-gtk3 xmodmap git
xbps-install -Suv
xbps-install dropbox
dropbox start

dropbox start

# Now enable xmodmap
cat << EOF > ~/modmap
       !
       ! Swap Caps_Lock and Control_L
       !
       remove Lock = Caps_Lock
       remove Control = Control_L
       keysym Control_L = Caps_Lock
       keysym Caps_Lock = Control_L
       add Lock = Caps_Lock
       add Control = Control_L
EOF

echo "Content has been written to ~/modmap."

# Now install further basic applications
# While this is running, start updating emacs

sudo xbps-install arandr aspell-en autoconf automake autorandr bison blueman dmenu fakeroot feh flex gcc gedit gimp git gpart gparted ibus ibus-m17n libreoffice lxappearance lxinput lyx m4 make mariadb network-manager-applet NetworkManager ntfs-3g okular p7zip pandoc patch pavucontrol pkgconf pdftk python-pip qbittorrent ripgrep rofi rsync rtorrent shotcut sudo texinfo texlive-bin Thunar thunar-volman timeshift unrar usbutils viewnior vim vlc wireless_tools wpa_supplicant polybar gvfs wmctrl git mu offlineimap cinnamon curl

dropbox exclude add ~/Dropbox/Cloud_Storage

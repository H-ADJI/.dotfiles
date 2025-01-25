# fixed workspaces, with nubmered navigation
gsettings set org.gnome.mutter dynamic-workspaces false
gsettings set org.gnome.desktop.wm.preferences num-workspaces 5
for i in {1..5}; do
  gsettings set "org.gnome.shell.keybindings" "switch-to-application-$i" "[]"
  gsettings set "org.gnome.shell.extensions.dash-to-dock" "app-hotkey-$i" "[]"
  gsettings set "org.gnome.desktop.wm.keybindings" "switch-to-workspace-$i" "['<Super>${i}']"
done

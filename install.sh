#/bin/bash

# check 7zip im path
if which 7z >/dev/null 2>&1; then
    echo "Installing ssh scripts..."
else
    echo "Install 7zip before... Aborting"
    exit 1
fi

rm -rf "$HOME/.ssh"
git clone https://github.com/harleysad/ssh.git ~/.ssh  

# mkdir "$HOME/.ssh"
# cp -R ./* "$HOME/.ssh"
chmod 700 $HOME/.ssh/*.sh

folder="$HOME/.ssh/public-keys"

#enable public keys to login
for file in "$HOME/.ssh/public-keys/*.pub"; do
  if [ -f "$file" ]; then 
       cat "$file" >>  "$HOME/.ssh/autorized_key"
  fi
done


# 7z a -p -mhe=on private-keys  private-keys

if [ -f "$HOME/.ssh/private-keys.7z" ]; then 
  echo "Starting config private keys"
else
  echo "No private keys"
  exit 1
fi

7z e $HOME/.ssh/private-keys.7z $HOME/.ssh/
if [ $? -ne 0 ]; then
  echo "Error extracting: private-keys.7z"
  exit 1
fi

SCRIPT_TO_SOURCE="source $HOME/.ssh/load-private-keys.sh"
TARGET_FILE="$HOME/.bashrc"

if grep -Fxq "$SCRIPT_TO_SOURCE" "$TARGET_FILE"; then
    echo "['$SCRIPT_TO_SOURCE'] already  in $TARGET_FILE."
else
    # Adicionar o comando no final do .bashrc
    echo "$SCRIPT_TO_SOURCE" >> "$TARGET_FILE"
    echo "['$SCRIPT_TO_SOURCE'] added to $TARGET_FILE."
fi
#/bin/bash

# ################################################
# Requerimentos
# ################################################
# check 7zip im path
if which 7z >/dev/null 2>&1; then
    echo "Installing ssh scripts..."
else
    echo "Install 7zip before... Aborting"
    exit 1
fi

# ################################################
# Prepara diretorios e faz limpa tudo
# ################################################
rm -rf "$HOME/.ssh"
git clone https://github.com/harleysad/ssh.git ~/.ssh  
# mkdir "$HOME/.ssh"
# cp -R ./* "$HOME/.ssh"
chmod 700 $HOME/.ssh/*.sh

# ################################################
# Chaves publicas 
# ################################################
folder="$HOME/.ssh/public-keys"
#enable public keys to login
for file in $HOME/.ssh/public-keys/*.pub; do
  echo "Installing public key $file"
  if [ -f "$file" ]; then 
       cat "$file" >>  "$HOME/.ssh/authorized_keys"
  fi
done
chmod -R 700 $HOME/.ssh/public-keys

# ################################################
# Descompacta chaves privadas
# ################################################
# 7z a -p -mhe=on private-keys  private-keys
# Verifica se existe chaves para configurar
if [ -f "$HOME/.ssh/private-keys.7z" ]; then 
  echo "Starting config private keys"
else
  echo "No private keys"
  exit 1
fi
# Descompacta as chaves
7z x $HOME/.ssh/private-keys.7z -o$HOME/.ssh/
if [ $? -ne 0 ]; then
  echo "Error extracting: private-keys.7z"
  exit 1
fi
chmod -R 700 $HOME/.ssh/private-keys

# ################################################
# Salva o script para carregar o ssh-agent
# no .bashrc
# ################################################
SCRIPT_TO_SOURCE="source $HOME/.ssh/load-private-keys.sh"
TARGET_FILE="$HOME/.bashrc"

if grep -Fxq "$SCRIPT_TO_SOURCE" "$TARGET_FILE"; then
    echo "['$SCRIPT_TO_SOURCE'] already  in $TARGET_FILE."
else
    # Adicionar o comando no final do .bashrc
    echo "$SCRIPT_TO_SOURCE" >> "$TARGET_FILE"
    echo "['$SCRIPT_TO_SOURCE'] added to $TARGET_FILE."
fi
#/bin/bash

#check if ssh-agente is running
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    eval $(ssh-agent -s) # > /dev/null 2>&1
fi

if [ $? -ne 0 ]; then
  echo "Error loading ssh-agent"
  exit 1
fi

for file in ~/.ssh/private-keys/*; do
  if [ -f "$file" ]; then 
       ssh-add "$file" # > /dev/null 2>&1
  fi
done

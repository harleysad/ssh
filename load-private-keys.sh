#/bin/bash

# Arquivo para salvar o ambiente do ssh-agent
SSH_ENV="$HOME/.ssh/agent-environment"

# Função para iniciar o ssh-agent
start_agent() {
    # mata os processos perdidos ( inda não sei as implicações )
    pkill ssh-agent 
    echo $(ssh-agent -s) > "$SSH_ENV"
    chmod 600 "$SSH_ENV"
}

#verifica se o arquivo com ultima config esta presente
if [ -f "$SSH_ENV" ]; then
    # verifica se o pid do agente carregado esta rodando
    # se não tem vai carregar um novo agente
    if ! ps -p $SSH_AGENT_PID > /dev/null 2>&1; then
        start_agent
    fi
    # carrega o agente do arquivo compartilhado no usuario
    source "$SSH_ENV" > /dev/null
else
    start_agent
fi

#carrega as chaves 
for file in ~/.ssh/private-keys/*; do
  if [ -f "$file" ]; then 
       ssh-add "$file" > /dev/null 2>&1
  fi
done


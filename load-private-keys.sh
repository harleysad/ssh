#/bin/bash

# Arquivo para salvar o ambiente do ssh-agent
SSH_ENV="$HOME/.ssh/agent-environment"

# Função para iniciar o ssh-agent
start_agent() {
    echo "Iniciando novo ssh-agent..."
    eval $(ssh-agent -s) > "$SSH_ENV"
    chmod 600 "$SSH_ENV"
}

# Carregar variáveis de ambiente salvas
if [ -f "$SSH_ENV" ]; then
    source "$SSH_ENV" > /dev/null
    # Verifica se o agente ainda está rodando
    if ! ps -p $SSH_AGENT_PID > /dev/null 2>&1; then
        start_agent
    fi
else
    start_agent
fi
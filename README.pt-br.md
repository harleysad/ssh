# Automação de Configuração de Chaves SSH

Automatize a configuração e o deploy de chaves SSH públicas e privadas em múltiplos ambientes com um único comando. Este repositório fornece uma maneira segura e simplificada de gerenciar suas credenciais SSH usando arquivos criptografados e scripts automatizados para Linux e Windows.

[**Read in English**](README.md)

---

## 🔒 Visão Geral de Segurança

> [!CAUTION]
> **Nunca armazene chaves privadas originais em um repositório público.**
> Este projeto utiliza um arquivo **7-Zip** protegido por senha (`private-keys.7z`) para proteger dados sensíveis. Certifique-se de usar uma senha forte e única ao criar seu arquivo.

## 📋 Pré-requisitos

Antes de executar os scripts de configuração, certifique-se de que as seguintes ferramentas estejam instaladas e disponíveis no `PATH` do seu sistema:

- **Git** (para gerenciamento de repositórios)
- **7-Zip** (para extração segura de chaves)
- **SSH Client** (OpenSSH)

## 🚀 Início Rápido

### 🐧 Linux / macOS
Execute o seguinte comando para baixar automaticamente o script de configuração e configurar suas chaves:

```bash
bash <(wget -qO- https://raw.githubusercontent.com/harleysad/ssh/main/install.sh) ~/.ssh
```

### 🪟 Windows (PowerShell)
> [!IMPORTANT]
> **Privilégios de Administrador** são necessários para iniciar o serviço `ssh-agent`.

Execute este comando em uma sessão do PowerShell com privilégios elevados:

```powershell
Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/harleysad/ssh/main/install.ps1").Content
```

---

## 🛠️ Como Funciona

1.  **Clonagem do Repositório:** O script clona este repositório no seu diretório local `.ssh`.
2.  **Configuração de Chaves Públicas:** As chaves públicas do diretório `public-keys/` são adicionadas ao seu ambiente.
3.  **Extração de Chaves Privadas:** O script solicita a senha para extrair o arquivo `private-keys.7z`.
4.  **Integração com o SSH Agent:** Inicia automaticamente o `ssh-agent` e carrega suas chaves, garantindo que estejam prontas para uso imediato.

## 📂 Estrutura do Projeto

- `public-keys/`: Coloque suas chaves públicas aqui (formato `.pub`).
- `private-keys.7z`: Um arquivo protegido por senha contendo suas chaves privadas.
- `install.sh`: Script de configuração para sistemas Linux/Unix.
- `install.ps1`: Script de configuração para Windows (PowerShell).
- `load-private-keys.sh`: Script auxiliar para persistir chaves entre sessões do shell (Linux).

## 🔧 Customização

Para adaptar este projeto para seu próprio uso:

1.  **Faça um Fork** deste repositório.
2.  **Atualize as URLs:** Substitua os links do GitHub na seção Início Rápido pela URL do seu fork.
3.  **Substitua as Chaves:**
    -   Adicione suas chaves públicas à pasta `public-keys/`.
    -   Crie um novo arquivo `private-keys.7z` com suas chaves privadas e uma senha forte.

---

## 🔑 Gerando Novas Chaves

Se você precisar gerar um novo par de chaves SSH:

### Linux / macOS
```bash
ssh-keygen -t ed25519 -C "seu_email@exemplo.com"
```

### Windows (PowerShell)
```powershell
ssh-keygen -t ed25519 -C "seu_email@exemplo.com"
```

---

*Mantido por [Harley SAD](https://github.com/harleysad).*

Write-Host "Começando a configuração de chaves para windows"
# verifica se o git esta instalado
$git = Get-Command git -ErrorAction SilentlyContinue
if ($git -eq $null) {
    Write-Host "Git não encontrado..."
    #sai do script
    exit
}

#verifica se o 7zip esta instalado, procurando o executavel nos arquivos de programas
$sevenzipPath = $null
$sevenzipCmd = Get-Command 7z -ErrorAction SilentlyContinue
if ($sevenzipCmd -ne $null) {
    $sevenzipPath = $sevenzipCmd.Source
}
if ($sevenzipPath -eq $null) {
    $sevenzipFile = Get-ChildItem -Path "C:\Program Files\7-Zip\7z.exe" -ErrorAction SilentlyContinue
    if ($sevenzipFile -ne $null) {
        $sevenzipPath = $sevenzipFile.FullName
    }
}
if ($sevenzipPath -eq $null) {
    $sevenzipFile = Get-ChildItem -Path "C:\Program Files (x86)\7-Zip\7z.exe" -ErrorAction SilentlyContinue
    if ($sevenzipFile -ne $null) {
        $sevenzipPath = $sevenzipFile.FullName
    }
}
if ($sevenzipPath -eq $null) {
    Write-Host "7zip não encontrado... nos diretórios padrões"
    Write-Host "Verifique se o 7zip está instalado"
    Write-Host "ou se o executável 7z.exe está no PATH"
    #sai do script
    exit
}

# limpa o diretorio ~./ssh do usuario corrente ( isso vai apagar as configurações atuais )
$ssh = Get-ChildItem -Path $HOME\.ssh
if ($ssh -ne $null) {
    Write-Host "Limpando o diretorio ~/.ssh"
    # remove o diretorio ~/.ssh
    Remove-Item -Path $HOME\.ssh -Recurse -Force
}

# clona o projeto do github para o diretorio ~/.ssh
$git = git clone https://github.com/harleysad/ssh.git $HOME\.ssh

# descompacta chaves privadas
& $sevenzipPath 'x' "$HOME\.ssh\private-keys.7z" "-o$HOME\.ssh"


# inicia o serviço ssh-agent
Get-Service ssh-agent | Set-Service -StartupType Automatic
Start-Service ssh-agent

# # faz um loop na pasta ~/.ssh/public-keys e as carrega no sistema
# $publicKeys = Get-ChildItem -Path $HOME\.ssh\public-keys
# foreach ($key in $publicKeys) {
#     # carrega a chave no sistema
#     ssh-add $key.FullName
# }

# faz um loop na pasta ~/.ssh/private-keys e as carrega no sistema
$privateKeys = Get-ChildItem -Path $HOME\.ssh\private-keys
foreach ($key in $privateKeys) {
    # carrega a chave no sistema
    ssh-add $key.FullName
}

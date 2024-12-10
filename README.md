# API Enem

## Dependencias

Para instalar o Docker no Linux, siga os passos abaixo. Estes passos são baseados na instalação do Docker em distribuições baseadas no Debian (como Ubuntu). Para outras distribuições, os comandos podem variar.

### 1. **Atualizar os pacotes do sistema**
Abra o terminal e execute o seguinte comando para garantir que todos os pacotes do sistema estejam atualizados:

```bash
sudo apt update
sudo apt upgrade
```

### 2. **Instalar dependências**
Instale pacotes que serão necessários para usar repositórios HTTPS:

```bash
sudo apt install apt-transport-https ca-certificates curl software-properties-common
```

### 3. **Adicionar a chave GPG do Docker**
Adicione a chave GPG oficial do Docker:

```bash
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
```

### 4. **Adicionar o repositório do Docker**
Adicione o repositório do Docker às suas fontes de software:

```bash
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

### 5. **Instalar o Docker**
Atualize os pacotes e instale o Docker:

```bash
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io
```

### 6. **Verificar a instalação**
Verifique se o Docker foi instalado corretamente:

```bash
sudo docker --version
```

### 7. **Executar o Docker sem sudo (opcional)**
Para evitar usar `sudo` em todos os comandos Docker, adicione seu usuário ao grupo Docker:

```bash
sudo usermod -aG docker $USER
```

Depois disso, saia e faça login novamente ou reinicie o sistema para que a mudança tenha efeito.

Para instalar o Docker Compose, siga os passos abaixo, de acordo com o seu sistema operacional:

### Em Linux (via pacote Docker):
1. **Verifique se o Docker já está instalado**:
   ```bash
   docker --version
   ```

2. **Baixe a versão mais recente do Docker Compose**:
   ```bash
   sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
   ```

3. **Dê permissão para que o Docker Compose seja executável**:
   ```bash
   sudo chmod +x /usr/local/bin/docker-compose
   ```

4. **Verifique se a instalação foi bem-sucedida**:
   ```bash
   docker-compose --version
   ```

Depois de instalar, você poderá usar o Docker Compose para gerenciar seus containers multi-serviço utilizando um arquivo `docker-compose.yml`.

## Clone repository

```bash
# Colone repository
git clone https://github.com/tianosouza/api_enem.git
```

### Usando containers...

```bash
# Create a new container
docker-compose up --build -d web
```

```bash
# Run container
docker exec -ti api_enem bash
```

# API Enem

## Dependencias

Para instalar o Docker no Linux, siga os passos abaixo. Estes passos são baseados na instalação do Docker em distribuições baseadas no Debian (como Ubuntu). Para outras distribuições, os comandos podem variar.

### 1. **Baixe o docker seguindo os passos da documentação**

[Docker](https://www.docker.com/get-started/)

#### **Assumindo que esteja usando o linux**

### 2. **Verificar a instalação**
Verifique se o Docker foi instalado corretamente:

```bash
sudo docker --version
```

### 3. **Executar o Docker sem sudo (opcional)**
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

**Antes de tudo crie um arquivo .env na raiz do projeto**

```bash
# Adicione ao arquivo .env
DB_HOST=api_enem-db
POSTGRES_DB=api_enem-pg
POSTGRES_USER=api_enem
POSTGRES_PASSWORD=api_enem
```

## No terminal

```bash
# Create a new container
docker-compose up --build -d web
```

```bash
# Run container
docker exec -ti api_enem bash
```

### No container....

```bash
# Criando o database e rodando as migrations
rails db:create db:migrate
```

```bash
# Iniciando o servidor
rails s -b 0.0.0.0 -p 4002
```

## NOTA
**Caso dê algum erro de pids e so ir ate ao diretorio tmp/pids e apagar o server.pid**



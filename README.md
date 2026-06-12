## Como Executar o Projeto

### Pré-requisitos

Antes de iniciar, certifique-se de possuir os seguintes softwares instalados:

- Docker Desktop
- Docker Compose
- Git

---

### 1. Clonar o Repositório

Abra um terminal e execute:

```bash
git clone https://github.com/josuemaas/trabalho03-cloud-shell.git
```

Acesse a pasta do projeto:

```bash
cd trabalho03-cloud-shell
```

---

### 2. Construir e Iniciar o Ambiente

Execute o comando abaixo para construir a imagem Docker e iniciar o container:

```bash
docker compose up -d --build
```

Verifique se o container foi criado corretamente:

```bash
docker ps
```

A saída deverá exibir o container:

```text
trabalho03-linux
```

---

### 3. Acessar o Container

Entre no ambiente Linux do projeto:

```bash
docker exec -it trabalho03-linux bash
```

Acesse a pasta dos scripts:

```bash
cd /app/scripts
```

Conceda permissão de execução aos scripts:

```bash
chmod 755 *.sh
```

---

### 4. Executar o Menu Principal

O projeto possui um menu para facilitar a execução das rotinas.

Execute:

```bash
./menu.sh
```

Será exibido o seguinte menu:

```text
===== MENU DEVOPS CLOUD =====

1 - Atualizar sistema
2 - Instalar Apache
3 - Criar estrutura do projeto
4 - Realizar backup
5 - Fazer deploy
6 - Ver processos
7 - Monitorar sistema
8 - Configurar usuários e permissões
9 - Gerar relatório
0 - Sair
```

---

### 5. Executar os Scripts Individualmente

#### Atualizar sistema

```bash
./01_update.sh
```

#### Instalar e validar Apache

```bash
./02_apache.sh
```

#### Criar estrutura do escritório contábil

```bash
./03_estrutura.sh
```

#### Gerar backup

```bash
./04_backup.sh
```

#### Realizar deploy do site

```bash
./05_deploy.sh
```

#### Listar processos

```bash
./06_processos.sh listar
```

#### Buscar processo Apache

```bash
./06_processos.sh buscar apache
```

#### Monitorar sistema

```bash
./07_monitoramento.sh
```

#### Configurar usuários e permissões

```bash
./08_usuarios_permissoes.sh
```

#### Gerar relatório operacional

```bash
./09_relatorio.sh
```

---

### 6. Verificar os Arquivos Gerados

#### Visualizar backups

```bash
ls -lh /app/backups
```

#### Visualizar logs

```bash
ls -lh /app/logs
```

#### Visualizar relatório operacional

```bash
cat /app/logs/relatorio_execucao.txt
```

---

### 7. Acessar o Site

Após executar o deploy, abra o navegador e acesse:

```text
http://localhost:8080
```

O site do Escritório Contábil deverá ser exibido corretamente.

---

### 8. Encerrar o Ambiente

Para sair do container:

```bash
exit
```

Para parar o ambiente Docker:

```bash
docker compose down
```

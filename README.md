## DockerHub

Imagem publicada no DockerHub:

https://hub.docker.com/r/josuemaas1/trabalho03-cloud-shell

A imagem foi construída a partir do Dockerfile desenvolvido para este trabalho e publicada no Docker Hub para permitir a reprodução do ambiente por outros usuários.

Para baixar a imagem publicada:

```bash
docker pull josuemaas1/trabalho03-cloud-shell:latest
```

Para executar a imagem:

```bash
docker run -d -p 8080:80 josuemaas1/trabalho03-cloud-shell:latest
```
# Como rodar o projeto
1. Executar essa linha para subir o postgres no docker
```bash
docker run --rm --name pg-docker -e POSTGRES_PASSWORD=docker -d -p 5432:5432 -v $HOME/docker/volumes/postgres:/var/lib/postgresql/data postgres:12.4
```
2. Configurar o database.yml
```bash
..
```
3. Criar o banco de dados e rodar as migrations
```bash
rails db:create db:migrate
```
4. Subir o projeto
```bash
rails s
```

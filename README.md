# Como rodar o projeto
1. Subir o postgres no docker
```bash
docker run --rm --name pg-docker -e POSTGRES_PASSWORD=docker -d -p 5432:5432 -v $HOME/docker/volumes/postgres:/var/lib/postgresql/data postgres:12.4
```
2. Configurar o database.yml
```bash
default: &default
  adapter: postgresql
  encoding: unicode
  database: challenge_api
  user: postgres
  password: docker
  host: localhost
  pool: 5

development:
  <<: *default
  database: challenge_api_development

test:
  <<: *default
  database: challenge_api_test

production:
  <<: *default
  database: challenge_api_production
  username: postgres
  password: <%= ENV['DATABASE_PASSWORD'] %>
```
3. Criar o banco de dados e rodar as migrations
```bash
rails db:create db:migrate
```
4. Subir o projeto
```bash
rails s
```
5. Acessar GRAPHIQL
```
http://localhost:3000/graphiql
```

* [doc da implementação](graphiql.md) : `GET /graphiql/`

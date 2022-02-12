# Como rodar o projeto
1. Subir o postgres no docker
```bash
docker run --rm --name pg-docker -e POSTGRES_PASSWORD=docker -d -p 5432:5432 -v $HOME/docker/volumes/postgres:/var/lib/postgresql/data postgres:12.4
```
2. Instalar Gems
```bash
bundle install
```
3. Configurar o database.yml
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
4. Criar o banco de dados e rodar as migrations
```bash
rails db:create db:migrate
```
5. Subir o projeto
```bash
rails s
```
6. Acessar GRAPHIQL
```
http://localhost:3000/graphiql
```
# Como rodar os testes

1. Rodar todos os testes
```
rspec ./spec/graphql
```
2. Rodar testes de Queries
```
rspec ./spec/graphql/queries
```
3. Rodar testes de Mutations
```
rspec ./spec/graphql/mutations
```

# Documentação da API
Documentação listando os endpoints e como usa-los. Lembrando que ao rodar o projeto você deve acessar `http://localhost:3000/graphiql` e colar cada endpoint listado abaixo.

## Empresa
1. Cadastrar uma empresa `atributo: [:name]`
```
mutation createCompany {
  createCompany(input: { name: "Qulture" }) {
    company {
      id
      name
    }
  }
}
```
1.2. Listar as empresas do sistema
```
query indexCompany {
  fetchCompanies {
    id
    name
  }
}
```
1.3. Ver uma empresa `atributo: [:companyId]`
```
query showCompany{
  fetchCompany(id: :companyId) {
    id
    name
  }
}
```
## Colaboradores
2.1. Cadastrar um colaborador em uma empresa `atributos: [:name, :email, :companyId]`
```
mutation createUser {
  createUser(input: { name: :name, email: :email, companyId: :companyId }) {
    user {
      id
      name
    }
  }
}

```
2.2. Listar os colaboradores de uma empresa `atributo: [:companyId]`
```
query showCompanyWithUser{
  fetchCompany(id: :companyId) {
    id
    name
    user {
      name
    }
  }
}
```
2.3.Apagar um colaborador de uma empresa `atributo: [:userId]`
```
mutation removeUserInCompany {
  removeUserCompany(input: { id: :userId }) {
    user {
      id
      name
    }
  }
}
```
## Organograma
3.1. Associar um colaborador como gestor de outro usuário `atributos: [:userId, :managerId]`
```
mutation addUserToManager {
  addManagerToUser(
    input: { id: :userId, managerId: :managerId }
  ) {
    user {
      id
      name
      manager {
        id
        name
      }
    }
  }
}
```
3.3.Listar os liderados diretos de um colaborador `atributo: [:userId]`
```
query showAllSubordinates {
  fetchUser(id: :userId) {
    id
    name
    subordinates {
      id
      name
    }
  }
}
```
3.4. Listar os liderados dos liderados de um colaborador (segundo nível) `atributo: [:userId]`
```
query showAllSubordinatesToSubordinates {
  fetchUser(id: :userId) {
    id
    name
    subordinates {
      id
      name
      level
      subordinates {
        id
        name
        level
      }
    }
  }
}
```

# Empresa
1. Cadastrar uma empresa `atributo: [:name]`
```
mutation createCompany {
  createCompany(input: {name: "Qulture"}) {
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
# Colaboradores
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
  removeUserCompany(input: {id: :userId}) {
    user {
      id
      name
    }
  }
}
```
# Organograma
3.1. Associar um colaborador como gestor de outro usuário `atributos: [:userId, :managerId]`
```
mutation addUserToManager {
  addManagerToUser(
    input: {id: :userId, managerId: :managerId}
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

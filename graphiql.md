# Empresa
1. Cadastrar uma empresa `atributo: [:name]`
```
mutation createCompany {
  createCompany(input: {name: :name}) {
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
1.3. Ver uma empresa `atributo: [:id]`
```
query showCompany{
  fetchCompany(id: :id) {
    id
    name
  }
}
```
# Colaboradores
2.1. Cadastrar um colaborador em uma empresa `atributos: [:name, :email]`
```
mutation createUser {
  createUser(input: {name: :name, email: :email"}) {
    user {
      id
      name
    }
  }
}
```
`atributos: [:name, :email]`
```
mutation addUserInCompany {
  addUserCompany(
    input: {id: :user_id, companyId: :company_id}
  ) {
    user {
      id
      name
      company {
        name
      }
      manager {
        name
      }
    }
  }
}
```
2.2. Listar os colaboradores de uma empresa `atributo: [:id]`
```
query showCompanyWithUser{
  fetchCompany(id: :id) {
    id
    name
    user {
      name
    }
  }
}
```
2.3.Apagar um colaborador de uma empresa `atributo: [:id]`
```
mutation removeUserInCompany {
  removeUserCompany(input: {id: :id}) {
    user {
      id
      name
    }
  }
}
```
# Organograma
3.1. Associar um colaborador como gestor de outro usuário `atributos: [:id, :manager_id]`
```
mutation addUserToManager {
  addManagerToUser(
    input: {id: :id, managerId: :manager_id}
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
3.3.Listar os liderados diretos de um colaborador `atributo: [:id]`
```
query showAllSubordinates {
  fetchUser(id: :id) {
    id
    name
    subordinates {
      id
      name
    }
  }
}
```
3.4. Listar os liderados dos liderados de um colaborador (segundo nível) atributo: [:id]`
```
query showAllSubordinatesToSubordinates {
  fetchUser(id: :id) {
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

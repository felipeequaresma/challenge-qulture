### 1. Epic: Empresa
# 1.1. Como usuário, quero cadastrar uma empresa (atributos: [:name])
mutation createCompany {
  createCompany(input: {name: /:name}) {
    company {
      id
      name
    }
  }
}

# 1.2. Como usuário, quero listar as empresas do sistema
query indexCompany {
  fetchCompanies {
    id
    name
  }
}

# 1.3. Como usuário, quero ver uma empresa
query showCompany{
  fetchCompany(id: /:company_id) {
    id
    name
  }
}

### 2. Epic: Colaboradores
# 2.1. Como usuário, quero cadastrar um colaborador em uma empresa (atributos: [:name, :email])
mutation createUser {
  createUser(input: {name: /:name, email: /:email"}) {
    user {
      id
      name
    }
  }
}

mutation addUserInCompany {
  addUserCompany(
    input: {id: /:user_id, companyId: /:company_id"}
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
# 2.2. Como usuário, quero listar os colaboradores de uma empresa
query showCompanyWithUser{
  fetchCompany(id: /:company_id) {
    id
    name
    user {
      name
    }
  }
}
# 2.3. Como usuário, quero apagar um colaborador de uma empresa
mutation removeUserInCompany {
  removeUserCompany(input: {id: /:user_id}) {
    user {
      id
      name
    }
  }
}
### 3. Epic: Organograma
# 3.1. Como usuário, quero associar um colaborador como gestor de outro usuário 
mutation addUserToManager {
  addManagerToUser(
    input: {id: /:user_id, managerId: /:manager_id}
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
# 3.3. Como usuário, quero listar os liderados diretos de um colaborador
query showAllSubordinates {
  fetchUser(id: /:user_id) {
    id
    name
    subordinates {
      id
      name
    }
  }
}
# 3.4. Como usuário, quero listar os liderados dos liderados de um colaborador (segundo nível)
query showAllSubordinatesToSubordinates {
  fetchUser(id: /:user_id) {
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
### 1. Epic: Empresa -> Company

# 1.1. Como usuário, quero cadastrar uma empresa (atributos: [:name])
mutation createCompany {
  createCompany(input: {name: "Teste1560dd"}) {
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
  fetchCompany(id: "e8d6ddda-6260-4a1c-a1d5-411c291fb8ee") {
    id
    name
  }
}

### 2. Epic: Colaboradores


# 2.1. Como usuário, quero cadastrar um colaborador em uma empresa (atributos: [:name, :email])
mutation createUser {
  createUser(input: {name: "Sofia", email: "sofia@testando.com"}) {
    user {
      id
      name
    }
  }
}

mutation addUserInCompany {
  addUserCompany(
    input: {id: "7be958ef-b690-4b24-b9a9-a798375d4339", companyId: "e8d6ddda-6260-4a1c-a1d5-411c291fb8ee"}
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
  fetchCompany(id: "e8d6ddda-6260-4a1c-a1d5-411c291fb8ee") {
    id
    name
    user {
      name
    }
  }
}

# 2.3. Como usuário, quero apagar um colaborador de uma empresa
mutation removeUserInCompany {
  removeUserCompany(input: {id: "06ec51b9-1dcf-4631-96b4-5f0aacee796c"}) {
    user {
      id
      name
    }
  }
}


### 3. Epic: Organograma

#3.1. Como usuário, quero associar um colaborador como gestor de outro usuário 
mutation addUserToManager {
  addManagerToUser(
    input: {id: "447ac236-aafa-459c-a915-f17392a8c063", managerId: "7be958ef-b690-4b24-b9a9-a798375d4339"}
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

#3.3. Como usuário, quero listar os liderados diretos de um colaborador
query showAllSubordinates {
  fetchUser(id: "06ec51b9-1dcf-4631-96b4-5f0aacee796c") {
    id
    name
    subordinates {
      id
      name
    }
  }
}

#3.4. Como usuário, quero listar os liderados dos liderados de um colaborador (segundo nível)
query showAllSubordinatesToSubordinates {
  fetchUser(id: "06ec51b9-1dcf-4631-96b4-5f0aacee796c") {
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

## User Stories
  
  ## 1. Epic: Empresa -> Company
    1.1. Como usuário, quero cadastrar uma empresa (atributos: [:name]) [ok]
    1.2. Como usuário, quero listar as empresas do sistema [ok]
    1.3. Como usuário, quero ver uma empresa [ok]
  
  ## 2. Epic: Colaboradores -> Contributors
    2.1. Como usuário, quero cadastrar um colaborador em uma empresa (atributos: [:name, :email]) -> create_contributors
    2.2. Como usuário, quero listar os colaboradores de uma empresa  -> get_all_enterprises
    2.3. Como usuário, quero apagar um colaborador de uma empresa -> delete_contributors
  
  ## 3. Epic: Organograma
    3.1. Como usuário, quero associar um colaborador como gestor de outro usuário
      - Atenção: Ambos precisam estar na mesma empresa
      - Cada usuário pode ter no máximo 1 gestor.
      - Uma pessoa abaixo de um líder na hierarquia não pode ser líder desse líder (não permitir loops)
    3.2. Como usuário, quero listar os pares de um colaborador (todos os colaboradores que são liderados do gestor desse colaborador)
    3.3. Como usuário, quero listar os liderados diretos de um colaborador
    3.4. Como usuário, quero listar os liderados dos liderados de um colaborador (segundo nível)
    
## Observações
  1. Não é preciso implementar autenticação [ok]
  2. Se preferir, você pode usar graphql, tecnologia que utilizamos hoje em dia na Qulture. [ok]
## Esperamos:
  1. clean code
  2. implementação em ruby, python ou javascript
  3. testes de unidade e testes de integração (não precisa ter uma cobertura enorme, o que julgar razoável)
  4. clean code
  5. atenção a detalhes
  6. documentação básica (não precisa ser extensiva) no readme 
  7. mantainable code
  8. preocupação com arquitetura e boas práticas de orientação a objetos
  9. código 100% em inglês
  10. consultas em casos de dúvidas ou comunicar grandes decisões/alterações de projeto
  11. postura ética: código original - você pode usar bibliotecas de apoio, mas a lógica de implementação principal deve ser sua
  12. clean code ;)
# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_company_mutation, mutation: Mutations::CreateCompanyMutation,
                                    description: 'Create new Company'
  end
end

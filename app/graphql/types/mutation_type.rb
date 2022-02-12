# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_company, mutation: Mutations::CreateCompany
    field :create_user, mutation: Mutations::CreateUser
    field :remove_user_company, mutation: Mutations::RemoveUserCompany
    field :add_manager_to_user, mutation: Mutations::AddManagerToUser
  end
end

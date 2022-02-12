# frozen_string_literal: true

module Types
  # app/graphql/types/user_type.rb
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :email, String, null: false
    field :name, String, null: false
    field :manager, Types::UserType
    field :company, Types::CompanyType
    field :subordinates, [Types::UserType]
    field :level, Integer
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end

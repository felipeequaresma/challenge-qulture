# frozen_string_literal: true

module Types
  # Description/Explanation of Person class
  class QueryType < Types::BaseObject
    # /companies
    field :companies, [Types::CompanyType], null: false

    def companies
      Company.all
    end

    # /company/:id
    field :company, Types::CompanyType, null: false do
      argument :id, ID
    end

    def company(id:)
      Company.find(id)
    end
  end
end

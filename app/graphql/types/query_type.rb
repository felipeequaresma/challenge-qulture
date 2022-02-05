# frozen_string_literal: true

module Types
  # Description/Explanation of Person class
  class QueryType < Types::BaseObject
    field :companies, [Types::CompanyType], null: false do
      description 'Query that selects all companies'
    end

    field :company, Types::CompanyType, null: false do
      description 'Get informations to Company'
      argument :id, ID
    end

    def companies
      Company.all
    end

    def company(id:)
      Company.find(id)
    end
  end
end

# frozen_string_literal: true

module Types
  # Description/Explanation of Person class
  class QueryType < Types::BaseObject
    # /companies
    field :fetch_companies, resolver: Queries::Company::FetchCompanies

    # /company/:id
    field :fetch_company, resolver: Queries::Company::FetchCompany
  end
end

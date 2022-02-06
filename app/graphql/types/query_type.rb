# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :fetch_companies, resolver: Queries::Company::FetchCompanies
    field :fetch_company, resolver: Queries::Company::FetchCompany
    field :fetch_user, resolver: Queries::User::FetchUser
  end
end

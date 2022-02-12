# frozen_string_literal: true

require 'rails_helper'

module Queries
  module Company
    RSpec.describe FetchCompanyUser, type: :request do
      describe 'execute schema' do
        it 'show users company' do
          query = <<-GRAPHQL
          query ($id: ID!) {
            fetchCompany(id: $id) {
              id
              name
              user {
                name
              }
            }
          }
          GRAPHQL

          factory_company = create(:company)
          create_list(:user, 5, company: factory_company)

          post '/graphql', params: { query: query, variables: { id: factory_company.id } }
          company_response = JSON.parse(response.body)

          expect(company_response['data']['fetchCompany']['user'].size).to eql(5)
        end
      end
    end
  end
end

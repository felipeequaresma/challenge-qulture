# frozen_string_literal: true

require 'rails_helper'

module Queries
  module Company
    RSpec.describe FetchCompany, type: :request do
      describe 'execute schema' do
        it 'show only comany' do
          query = <<-GRAPHQL
            query ($id: ID!) {
              fetchCompany(id: $id) {
                id
                name
              }
            }
          GRAPHQL

          factory_companies = create_list(:company, 5)

          post '/graphql', params: { query: query, variables: { id: factory_companies.first.id } }
          company = JSON.parse(response.body)

          expect(company['data']['fetchCompany']['id']).to eql(factory_companies.first.id)
        end
      end
    end
  end
end

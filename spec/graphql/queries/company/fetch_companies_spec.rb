# frozen_string_literal: true

require 'rails_helper'

module Queries
  module Company
    RSpec.describe FetchCompanies, type: :request do
      describe 'execute schema' do
        it 'show all companies' do
          query = <<-GRAPHQL
            query {
              fetchCompanies {
                id
                name
              }
            }
          GRAPHQL

          create_list(:company, 5)

          post '/graphql', params: { query: query }
          companies = JSON.parse(response.body)

          expect(companies['data']['fetchCompanies'].size).to eql(5)
        end
      end
    end
  end
end

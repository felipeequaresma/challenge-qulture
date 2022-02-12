# frozen_string_literal: true

require 'rails_helper'

module Queries
  module User
    RSpec.describe FetchUser, type: :request do
      describe 'execute schema' do
        it 'show only user' do
          query = <<-GRAPHQL
            query ($id: ID!) {
              fetchUser(id: $id) {
                id
                name
              }
            }
          GRAPHQL

          factory_users = create_list(:user, 5)

          post '/graphql', params: { query: query, variables: { id: factory_users.first.id } }
          user_response = JSON.parse(response.body)

          expect(user_response['data']['fetchUser']['id']).to eql(factory_users.first.id)
        end
      end
    end
  end
end

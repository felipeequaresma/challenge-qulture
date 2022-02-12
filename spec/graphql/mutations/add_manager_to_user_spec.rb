# frozen_string_literal: true

require 'rails_helper'

module Mutations
  RSpec.describe AddManagerToUser, type: :request do # rubocop:disable Metrics/BlockLength
    let(:add_manager_to_user) { AddManagerToUser.new(field: nil, object: nil, context: {}) }

    describe 'can manage other users' do
      it 'have the requirements' do
        factory_company = create(:company)

        users = create_pair(:user, company: factory_company)
        user = add_manager_to_user.resolve(id: users.first.id, manager_id: users.second.id)

        expect(user[:user][:manager_id]).not_to be_nil
      end
    end

    describe 'cannot manage other users' do
      it 'hierarchy does not allow' do
        factory_company = create(:company)
        factory_user = create(:user, company: factory_company)
        factory_user_manager = create(:user, level: 2, company: factory_company)

        add_manager_to_user.resolve(id: factory_user.id, manager_id: factory_user_manager.id)

        expect do
          raise 'Cannot allow manager this user'
        end.to raise_error('Cannot allow manager this user')
      end

      it 'not the same company' do
        factory_companies = create_pair(:company)
        factory_user = create(:user, company: factory_companies.first)
        factory_user_manager = create(:user, company: factory_companies.second)

        add_manager_to_user.resolve(id: factory_user.id, manager_id: factory_user_manager.id)

        expect do
          raise 'Cannot allow manager this user'
        end.to raise_error('Cannot allow manager this user')
      end
    end
  end
end

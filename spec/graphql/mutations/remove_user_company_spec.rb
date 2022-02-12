# frozen_string_literal: true

require 'rails_helper'

module Mutations
  RSpec.describe RemoveUserCompany, type: :request do # rubocop:disable Metrics/BlockLength
    let(:remove_user_company) { RemoveUserCompany.new(field: nil, object: nil, context: {}) }
    let(:add_manager_to_user) { AddManagerToUser.new(field: nil, object: nil, context: {}) }

    describe 'user can be deleted' do
      it 'user withoud subordinates was deleted' do
        factory_user = create(:user)

        remove_user_company.resolve(id: factory_user.id)

        expect(User.count).to eql(0)
      end

      it 'user manager was deleted' do
        factory_company = create(:company)
        factory_user = create(:user, company_id: factory_company)
        factory_manager = create(:user, level: 2, company: factory_company)

        add_manager_to_user.resolve(id: factory_user.id, manager_id: factory_manager.id)
        remove_user_company.resolve(id: factory_manager.id)

        user = User.find_by(id: factory_user.id)
        manager = User.find_by(id: factory_manager.id)

        expect(user.present?).to be_truthy
        expect(user.manager).to be_nil
        expect(manager.present?).not_to be_truthy
      end
    end

    describe 'user cannot be deleted' do
      it 'user not found' do
        remove_user_company.resolve(id: SecureRandom.uuid)

        expect do
          raise 'User not found'
        end.to raise_error('User not found')
      end
    end
  end
end

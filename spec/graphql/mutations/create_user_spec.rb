# frozen_string_literal: true

require 'rails_helper'

module Mutations
  RSpec.describe CreateCompany, type: :request do # rubocop:disable Metrics/BlockLength
    let(:create_new_user) { CreateUser.new(field: nil, object: nil, context: {}) }

    describe 'the user can be created' do
      it 'user was created' do
        factory_company = create(:company)

        user = create_new_user.resolve(name: 'Christophe', email: 'kirsten.greenholt@corkeryfisher.info',
                                       company_id: factory_company.id)
        expect(user[:user][:name]).to eq('Christophe')
      end
    end

    describe 'the user cannot be created' do
      it 'name has already exist' do
        factory_user = create(:user)
        create_new_user.resolve(name: factory_user.name, email: 'kirsten.greenholt@corkeryfisher.info',
                                company_id: factory_user.company.id)
        expect do
          raise 'Name has already been taken'
        end.to raise_error('Name has already been taken')
      end

      it 'email has already exist' do
        factory_user = create(:user)
        create_new_user.resolve(name: 'Christophe', email: factory_user.email,
                                company_id: factory_user.company.id)
        expect do
          raise 'Email has already been taken'
        end.to raise_error('Email has already been taken')
      end

      it 'company does exist' do
        create_new_user.resolve(name: 'Christophe', email: 'kirsten.greenholt@corkeryfisher.info',
                                company_id: SecureRandom.uuid)
        expect do
          raise 'Company does not exist.'
        end.to raise_error('Company does not exist.')
      end
    end
  end
end

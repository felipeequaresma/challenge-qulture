# frozen_string_literal: true

require 'rails_helper'

module Mutations
  RSpec.describe CreateCompany, type: :request do
    let(:create_new_company) { CreateCompany.new(field: nil, object: nil, context: {}) }

    describe 'the company can be created' do
      it 'company was created' do
        company = create_new_company.resolve(name: 'Qulture')

        expect(company[:company][:name]).to eq('Qulture')
      end
    end

    describe 'the company cannot be created' do
      it 'name has already exist' do
        factory_company = create(:company)
        create_new_company.resolve(name: factory_company.name)

        expect do
          raise 'Name has already been taken'
        end.to raise_error('Name has already been taken')
      end
    end
  end
end

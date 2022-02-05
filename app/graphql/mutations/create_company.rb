# frozen_string_literal: true

module Mutations
  class CreateCompany < BaseMutation
    argument :name, String, required: true, description: "The company's name"

    field :company, Types::CompanyType, null: false
    field :errors, [String], null: false

    def resolve(name:)
      company = Company.new(name: name)

      return { company: nil, errors: company.errors.full_messages } unless company.save

      { company: company, errors: [] }
    end
  end
end

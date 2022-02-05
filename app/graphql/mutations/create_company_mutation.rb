# frozen_string_literal: true

module Mutations
  class CreateCompanyMutation < BaseMutation
    field :company, Types::CompanyType, null: false

    argument :name, String, required: true do
      description "The company's name"
    end

    def resolve(name:)
      @company = Company.new(name: name)

      return { company: nil, errors: @company.errors.full_messages } unless @company.save!

      { company: @company, errors: [] }
    end
  end
end

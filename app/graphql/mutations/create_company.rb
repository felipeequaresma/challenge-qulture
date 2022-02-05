# frozen_string_literal: true

module Mutations
  # Create company
  class CreateCompany < BaseMutation
    argument :name, String, required: true, description: "The company's name"

    field :company, Types::CompanyType, null: false

    def resolve(name:)
      company = Company.create!(name: name)

      { company: company }
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
        " #{e.record.errors.full_messages.join(', ')}")
    end
  end
end

# frozen_string_literal: true

module Mutations
  # Create user
  class CreateUser < BaseMutation
    argument :name, String, required: true, description: "The User's name"
    argument :email, String, required: true, description: "The User's email"
    argument :company_id, ID, required: true, description: "The User's Company"

    field :user, Types::UserType, null: false

    def resolve(name:, email:, company_id:)
      company = ::Company.find(company_id)
      user = company.user.create!(name: name, email: email)

      { user: user }
    rescue ActiveRecord::RecordNotFound => _e
      GraphQL::ExecutionError.new('Company does not exist.')
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
        "#{e.record.errors.full_messages.join(', ')}")
    end
  end
end

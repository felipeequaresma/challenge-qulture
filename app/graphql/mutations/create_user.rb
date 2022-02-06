# frozen_string_literal: true

module Mutations
  # Create user
  class CreateUser < BaseMutation
    argument :name, String, required: true, description: "The User's name"
    argument :email, String, required: true, description: "The User's email"

    field :user, Types::UserType, null: false

    def resolve(name:, email:)
      user = User.create!(name: name, email: email)

      { user: user }
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
        "#{e.record.errors.full_messages.join(', ')}")
    end
  end
end

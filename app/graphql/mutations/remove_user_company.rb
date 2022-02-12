# frozen_string_literal: true

module Mutations
  # Remove User Company
  class RemoveUserCompany < BaseMutation
    argument :id, ID, required: true, description: 'The User Uuid'

    field :user, Types::UserType, null: false

    def resolve(id:)
      user = ::User.find(id)
      user.destroy!

      { user: user }
    rescue ActiveRecord::RecordNotFound => _e
      GraphQL::ExecutionError.new('User not found')
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
        "#{e.record.errors.full_messages.join(', ')}")
    end
  end
end

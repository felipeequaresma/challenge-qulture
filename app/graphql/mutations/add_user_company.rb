# frozen_string_literal: true

module Mutations
  # Destroy user
  class AddUserCompany < BaseMutation
    argument :id, ID, required: true, description: 'The User Uuid'
    argument :company_id, ID, required: true, description: 'The Company Uuid'

    field :user, Types::UserType, null: false

    def resolve(id:, company_id:)
      company = ::Company.find(company_id)
      user = ::User.find(id)
      user.update!(company: company)

      { user: user }
    rescue ActiveRecord::RecordNotFound => _e
      GraphQL::ExecutionError.new("Field doesn't exist.")
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
        "#{e.record.errors.full_messages.join(', ')}")
    end
  end
end

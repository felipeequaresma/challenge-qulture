# frozen_string_literal: true

module Mutations
  # app/graphql/mutations/add_manager_to_user.rb
  class AddManagerToUser < BaseMutation
    argument :id, ID, required: true, description: 'The User Uuid'
    argument :manager_id, ID, required: true, description: 'The Manager Uuid'

    field :user, Types::UserType, null: false

    def resolve(id:, manager_id:)
      user = ::User.find(id)

      return GraphQL::ExecutionError.new('Cannot allow manager this user') unless can_be_manager?(user, manager_id)

      user.update!(manager_id: manager_id)

      { user: user }
    rescue ActiveRecord::RecordNotFound => e
      GraphQL::ExecutionError.new(e.message)
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new(e.record.errors.full_messages.join(', ').to_s)
    end

    private

    def can_be_manager?(user, manager_id)
      return if subordinate?(user, manager_id)
      return unless same_company?(user)

      true
    end

    def subordinate?(user, manager_id)
      user.subordinates.exists?(manager_id)
    end

    def same_company?(user)
      user.manager&.company.present? &&
        user.manager&.company&.id.eql?(user.company&.id)
    end
  end
end

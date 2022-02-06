# frozen_string_literal: true

module Mutations
  # app/graphql/mutations/add_manager_to_user.rb
  class AddManagerToUser < BaseMutation
    argument :id, ID, required: true, description: 'The User Uuid'
    argument :manager_id, ID, required: true, description: 'The Manager Uuid'

    field :user, Types::UserType, null: false

    def resolve(id:, manager_id:) # rubocop:disable Metrics/AbcSize
      users = ::User.find(id, manager_id)
      user = users.first
      manager = users.second

      return GraphQL::ExecutionError.new('Cannot allow manager this user') unless can_be_manager?(user, manager)

      user.update!(level: manager.level.next, manager_id: manager.id)

      { user: user }
    rescue ActiveRecord::RecordNotFound => e
      GraphQL::ExecutionError.new(e.message)
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new(e.record.errors.full_messages.join(', ').to_s)
    end

    private

    def can_be_manager?(user, manager)
      return unless permited_manager?(user, manager)

      # && same_company?(user)

      true
    end

    def permited_manager?(user, manager)
      return true if manager.level.nil? || user.level.nil?

      manager.level <= user.level
    end

    def same_company?(user)
      return true if user.manager&.company.nil?

      user.manager&.company&.id.eql?(user.company&.id)
    end
  end
end

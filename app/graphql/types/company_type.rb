# frozen_string_literal: true

module Types
  class CompanyType < Types::BaseObject
    field :id, ID, null: false do
      description "This company's uuid"
    end
    field :name, String, null: false do
      description "This company's name"
    end
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false do
      description 'The date/time that this post was created at'
    end
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false do
      description 'The date/time that this post was updated at'
    end
    field :user, [Types::UserType], description: "This post's comments, or null if this post has comments disabled."
  end

  # TODO: remove n+1 queries
end

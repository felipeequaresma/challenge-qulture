# frozen_string_literal: true

# app/models/user.rb
class User < ApplicationRecord
  self.belongs_to_required_by_default = false

  has_many :subordinates, dependent: :nullify, class_name: 'User', foreign_key: 'manager_id'

  belongs_to :manager, class_name: 'User'
  belongs_to :company

  validates :name, :email, presence: true, uniqueness: true
end

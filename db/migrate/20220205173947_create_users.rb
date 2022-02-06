# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.0] # rubocop:disable Style/Documentation
  def change
    create_table :users, id: :uuid do |t|
      t.string :email, null: false
      t.string :name, null: false

      t.references :manager, type: :uuid, foreign_key: { to_table: :users }, index: true
      t.belongs_to :company, optional: true, type: :uuid

      t.timestamps
    end
  end
end

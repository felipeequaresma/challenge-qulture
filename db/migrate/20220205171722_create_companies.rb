# frozen_string_literal: true

class CreateCompanies < ActiveRecord::Migration[6.0] # rubocop:disable Style/Documentation
  def change
    create_table :companies, id: :uuid do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end

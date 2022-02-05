# frozen_string_literal: true

class EnableUuidPg < ActiveRecord::Migration[6.0]  # rubocop:disable Style/Documentation
  def change
    enable_extension 'pgcrypto'
  end
end

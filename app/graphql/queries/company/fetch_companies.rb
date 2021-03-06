# frozen_string_literal: true

module Queries
  module Company
    # Companies
    class FetchCompanies < Queries::BaseQuery
      type [Types::CompanyType], null: false

      def resolve
        ::Company.all.includes(:user)
      end
    end
  end
end

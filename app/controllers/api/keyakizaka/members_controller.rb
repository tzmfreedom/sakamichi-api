module Api
  module Keyakizaka
    class MembersController < ApplicationController
      include ::Swagger::Blocks

      swagger_path '/keyakizaka/members' do
        operation :get do
          key :summary, 'Search Keyakizaka46 members by attribute'
          key :description, 'Search Keyakizaka46 member by attribute'
          key :tags, [
              'keyakizaka'
          ]
          parameter do
            key :name, :name
            key :in, :query
            key :description, 'name'
            key :type, :string
          end
          response 200 do
            key :description, 'Keyakizaka46 members'
            schema do
            end
          end
        end
      end

      def index
        @members = ::Keyakizaka::Member.search(params)
        render json: @members
      end
    end
  end
end

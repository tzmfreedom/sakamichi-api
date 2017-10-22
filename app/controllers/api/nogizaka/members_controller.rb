module Api
  module Nogizaka
    class MembersController < ApplicationController
      include ::Swagger::Blocks

      swagger_path '/nogizaka/members' do
        operation :get do
          key :summary, 'Search Nogizaka46 members by attribute'
          key :description, 'Search Nogizaka46 member by attribute'
          key :tags, [
              'nogizaka'
          ]
          parameter do
            key :name, :name
            key :in, :query
            key :description, 'name'
            key :type, :string
          end
          response 200 do
            key :description, 'Nogizaka46 members'
            schema do
            end
          end
        end
      end

      def index
        @members = ::Nogizaka::Member.search(params)
        render json: @members
      end
    end
  end
end

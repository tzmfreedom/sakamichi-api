module Api
  module HiraganaKeyaki
    class MembersController < ApplicationController
      include ::Swagger::Blocks

      swagger_path '/hiragana_keyaki/members' do
        operation :get do
          key :summary, 'Search Hiragana-Keyakizaka46 members by attribute'
          key :description, 'Search Hiragana-Keyakizaka46 member by attribute'
          key :tags, [
              'hiragana-keyakizaka'
          ]
          parameter do
            key :name, :name
            key :in, :query
            key :description, 'name'
            key :type, :string
          end
          response 200 do
            key :description, 'Hiragana-Keyakizaka46 members'
            schema do
            end
          end
        end
      end

      def index
        @members = ::HiraganaKeyaki::Member.search(params)
        render json: @members
      end
    end
  end
end

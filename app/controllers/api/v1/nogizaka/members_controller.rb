module Api
  module V1
    module Nogizaka
      class MembersController < ApplicationController
        def index
          @members = ::Nogizaka::Member.search(params)

          render json: @members
        end
      end
    end
  end
end

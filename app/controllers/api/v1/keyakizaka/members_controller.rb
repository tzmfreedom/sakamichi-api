module Api
  module V1
    module Keyakizaka
      class MembersController < ApplicationController
        def index
          @members = ::Keyakizaka::Member.search(params)

          render json: @members
        end
      end
    end
  end
end

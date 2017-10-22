module Api
  module Keyakizaka
    class MembersController < ApplicationController
      def index
        @members = ::Keyakizaka::Member.search(params)
        render json: @members
      end
    end
  end
end

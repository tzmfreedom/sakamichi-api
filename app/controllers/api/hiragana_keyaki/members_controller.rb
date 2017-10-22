module Api
  module HiraganaKeyaki
    class MembersController < ApplicationController
      def index
        @members = ::HiraganaKeyaki::Member.search(params)
        render json: @members
      end
    end
  end
end

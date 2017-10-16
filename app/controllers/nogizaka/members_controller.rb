module Nogizaka
  class MembersController < ApplicationController
    # GET /members
    def index
      @members = Nogizaka::Member.search(params)

      render json: @members
    end

    # GET /members/1
    def show
      @member = Nogizaka::Member.find_by(code: params[:id])
      render json: @member
    end
  end
end

module Nogizaka
  class Member < ApplicationRecord
    def find_by(code:)
      Nogizaka::MEMBER
    end
  end
end

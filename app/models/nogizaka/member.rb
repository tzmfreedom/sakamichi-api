module Nogizaka
  class Member < ApplicationRecord
    def search(name:)
      Nogizaka::MEMBER.select do |member|
        /#{name}/.match(member[:name]) || /#{name}/.match(member[:hiragana])
      end
    end
  end
end

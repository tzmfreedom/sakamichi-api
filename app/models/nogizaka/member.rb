module Nogizaka
  class Member < ::Member
    def self.search(params)
      super(Nogizaka::MEMBERS, params)
    end
  end
end

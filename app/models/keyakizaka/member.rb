module Keyakizaka
  class Member < ::Member
    def self.search(params)
      super(Keyakizaka::MEMBERS, params)
    end
  end
end

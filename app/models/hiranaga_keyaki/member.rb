module HiraganaKeyaki
  class Member < ::Member
    def self.search(params)
      super(HiraganaKeyaki::MEMBERS, params)
    end
  end
end

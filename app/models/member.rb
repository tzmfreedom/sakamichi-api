class Member
  def self.search(records, params)
    records.select do |record|
      member = Hash[record.map { |k, v| [k.to_sym, v] }]
      next true if params[:name].present? && /#{params[:name]}/.match(member[:name])
      next true if params[:name].present? && /#{params[:name]}/.match(member[:hiragana])
      false
    end
  end
end

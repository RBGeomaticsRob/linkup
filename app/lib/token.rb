class Token

  attr_reader :hash, :timestamp

  def initialize
    @hash = create_hash
    @timestamp = Time.now
  end

  def create_hash
    (0..5).inject('') do |string, _num|
      string << ('A'..'Z').to_a.sample
    end
  end

end

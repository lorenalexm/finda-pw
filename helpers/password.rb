class Password
  def self.generate options = Hash.new
    options[:length] ||= 8

    pool = ('a'..'z').to_a + ('0'..'9').to_a
    out = (1..options[:length]).collect do
      pool[rand(pool.size)]
    end
    return out.join
  end
end
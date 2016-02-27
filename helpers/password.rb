class Password
  def self.generate
    pool = ('a'..'z').to_a + ('0'..'9').to_a
    out = (1..8).collect do
      pool[rand(pool.size)]
    end
    return out.join
  end
end
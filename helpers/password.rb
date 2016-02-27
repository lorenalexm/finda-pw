class Password
  def self.generate options = Hash.new
    options[:length] ||= 8
    options[:digits] = true if options[:digits].nil?

    pool = Array.new
    pool += ('a'..'z').to_a
    pool += ('0'..'9').to_a if options[:digits] == true

    out = (1..options[:length]).collect do
      pool[rand(pool.size)]
    end
    return out.join
  end
end
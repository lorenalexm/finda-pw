class Password
  def self.generate options = Hash.new
    options[:length] ||= 8
    options[:digits] = true if options[:digits].nil?
    options[:lowercase] = true if options[:lowercase].nil?
    options[:uppercase] = false if options[:uppercase].nil?

    pool = Array.new
    pool += ('a'..'z').to_a if options[:lowercase]
    pool += ('0'..'9').to_a if options[:digits]
    pool += ('A'..'Z').to_a if options[:uppercase]

    out = (1..options[:length]).collect do
      pool[rand(pool.size)]
    end
    return out.join
  end
end
class Password
  def self.generate(options = Hash.new)
    options[:length] ||= 8
    options[:digits] = true if options[:digits].nil?
    options[:lowercase] = true if options[:lowercase].nil?
    options[:uppercase] = false if options[:uppercase].nil?
    options[:symbols] = false if options[:symbols].nil?
    options[:alike] = true if options[:alike].nil?
    options[:count] ||= 1

    pool = Array.new
    pool += ('a'..'z').to_a if options[:lowercase]
    pool += ('0'..'9').to_a if options[:digits]
    pool += ('A'..'Z').to_a if options[:uppercase]
    pool += ('!'..'-').to_a if options[:symbols]
    pool.shuffle!

    return nil if pool.empty?

    if options[:alike] == false
      alike = Array.new
      alike += ['B', '8', 'G', '6', 'I', '1', 'l', '0', 'O', 'Q', 'D', 'S', '5', 'Z', '2','v', 'V', 'w', 'W', 'u', 'U']
      pool.delete_if do |i|
        alike.include? i
      end
    end

    if options[:count] > 1
      out = Array.new
      options[:count].times do |pass|
        pass = (1..options[:length]).collect { pool.sample }
        out.push pass.join
      end
      return out
    else
      out = (1..options[:length]).collect { pool.sample }
      puts out.join
      return out.join
    end
  end
end

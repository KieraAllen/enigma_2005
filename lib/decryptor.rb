class Decryptor
  attr_reader :message,
              :key,
              :date,
              :character_set

  def initialize(message, key, date)
    @message = message
    @key = key
    @date = date
    @character_set = ("a".."z").to_a << " "
  end

  def create_offsets(date)
    squared_date = date.to_i ** 2
    squared_date.to_s[-4..-1]
  end

end

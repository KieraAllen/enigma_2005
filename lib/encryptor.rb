# we need an Encryptor class that encrypts
class Encryptor
  attr_reader :message,
              :key,
              :date

  def initialize(message, key, date)
    @message = message
    @key = key
    @date = date
  end

  def encrypt

  end

  def create_offsets
    squared_date = date.to_i ** 2
    squared_date.to_s[-4..-1]
  end

  # A offset: The first digit (1)
  # B offset: The second digit (0)
  # C offset: The third digit (2)
  # D offset: The fourth digit (5)
end

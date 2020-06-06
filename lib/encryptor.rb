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

  def create_offsets
    squared_date = date.to_i ** 2
    squared_date.to_s[-4..-1]
  end

  def create_shift(key, offset, shift_type)
    if shift_type == :A
      key[0..1].to_i + offset[0].to_i
    elsif shift_type == :B
      key[1..2].to_i + offset[1].to_i
    elsif shift_type == :C
      key[2..3].to_i + offset[2].to_i
    else
      key[3..4].to_i + offset[3].to_i
    end
  end

  # def a_shift(key, offset, character)
  # end



  # A offset: The first digit (1)
  # B offset: The second digit (0)
  # C offset: The third digit (2)
  # D offset: The fourth digit (5)
end

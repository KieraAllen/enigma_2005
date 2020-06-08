class Decryptor
  attr_reader :message,
              :key,
              :offset,
              :date,
              :character_set

  def initialize(message, key, date)
    @message = message
    @key = key
    @offset = create_offsets(date)
    @character_set = ("a".."z").to_a << " "
  end

  def create_offsets(date)
    squared_date = date.to_i ** 2
    squared_date.to_s[-4..-1]
  end

  def create_shift(shift_type)
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
end

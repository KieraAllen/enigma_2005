class Encryptor
  attr_reader :message,
              :key,
              :offset,
              :character_set

  def initialize(message, key, date)
    @message = message.downcase
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

  def find_valid_index(index, shift)
    new_value = index + shift
    while new_value > 26
      new_value -= 27
    end
    new_value
  end

  def a_shift(character)
    shift_value = create_shift(:A)
    character_index = character_set.index(character)
    new_index = find_valid_index(character_index, shift_value)
    character_set[new_index]
  end

  def b_shift(character)
    shift_value = create_shift(:B)
    character_index = character_set.index(character)
    new_index = find_valid_index(character_index, shift_value)
    character_set[new_index]
  end

  def c_shift(character)
    shift_value = create_shift(:C)
    character_index = character_set.index(character)
    new_index = find_valid_index(character_index, shift_value)
    character_set[new_index]
  end

  def d_shift(character)
    shift_value = create_shift(:D)
    character_index = character_set.index(character)
    new_index = find_valid_index(character_index, shift_value)
    character_set[new_index]
  end

  def encrypt
    separated_message = message.split("")
    encrypted_message = []
    separated_message.each_with_index do |character, index|
      if !character_set.include?(character)
        encrypted_message << character
        next
      end
      if index % 4 == 0
        encrypted_message << a_shift(character)
      elsif index % 4 == 1
        encrypted_message << b_shift(character)
      elsif index % 4 == 2
        encrypted_message << c_shift(character)
      else
        encrypted_message << d_shift(character)
      end
    end
    encrypted_message.join
  end
end

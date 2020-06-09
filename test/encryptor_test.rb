require_relative 'test_helper'
require './lib/encryptor'

class EncryptorTest < Minitest::Test

  def setup
    @encryptor = Encryptor.new("hello world!", "02715", "040895")
  end

  def test_it_exists
    assert_instance_of Encryptor, @encryptor
  end

  def test_it_can_read_attributes
    expected = ("a".."z").to_a << " "

    assert_equal "hello world!", @encryptor.message
    assert_equal "02715", @encryptor.key
    assert_equal "1025", @encryptor.offset
    assert_equal expected, @encryptor.character_set
  end

  def test_it_can_create_offsets
    assert_equal "1025", @encryptor.create_offsets("040895")
  end

  def test_it_can_create_shift
    assert_equal 3, @encryptor.create_shift(:A)
    assert_equal 73, @encryptor.create_shift(:C)
    assert_equal 27, @encryptor.create_shift(:B)
    assert_equal 20, @encryptor.create_shift(:D)
  end

  def test_it_can_find_valid_index
    index = 4
    shift = 26
    assert_equal 3, @encryptor.find_valid_index(index, shift)
  end

  def test_it_has_all_shift_types
    assert_equal "k", @encryptor.a_shift("h")
    assert_equal "e", @encryptor.b_shift("e")
    assert_equal "d", @encryptor.c_shift("l")
    assert_equal "e", @encryptor.d_shift("l")
    assert_equal "r", @encryptor.a_shift("o")
    assert_equal " ", @encryptor.b_shift(" ")
  end

  def test_it_can_encrypt
    assert_equal "keder ohulw!", @encryptor.encrypt
  end
end

require_relative 'test_helper'
require 'date'
require './lib/decryptor'

class DecryptorTest < Minitest::Test

  def setup
    @decryptor = Decryptor.new("keder ohulw", "02715", "040895")
  end

  def test_it_exists
    assert_instance_of Decryptor, @decryptor
  end

  def test_it_can_read_attributes
      expected = ("a".."z").to_a << " "

      assert_equal "keder ohulw", @decryptor.message
      assert_equal "02715", @decryptor.key
      assert_equal "1025", @decryptor.offset
      assert_equal expected, @decryptor.character_set
  end

  def test_it_can_create_offsets
    assert_equal "1025", @decryptor.create_offsets("040895")
  end

  def test_it_can_create_shift
    assert_equal 3, @decryptor.create_shift(:A)
    assert_equal 73, @decryptor.create_shift(:C)
    assert_equal 27, @decryptor.create_shift(:B)
    assert_equal 20, @decryptor.create_shift(:D)
  end
end

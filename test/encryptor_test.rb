require_relative 'test_helper'
require 'date'
require './lib/encryptor'

class EncryptorTest < Minitest::Test

  def setup
    @encryptor = Encryptor.new("hello world", "02715", "040895")
  end

  def test_it_exists
    assert_instance_of Encryptor, @encryptor
  end

  def test_it_can_read_attributes
    expected = ("a".."z").to_a << " "

    assert_equal "hello world", @encryptor.message
    assert_equal "02715", @encryptor.key
    assert_equal "040895", @encryptor.date
    assert_equal expected, @encryptor.character_set
  end

  def test_it_can_create_offsets
    assert_equal "1025", @encryptor.create_offsets
  end

  def test_it_can_create_shift
    assert_equal 3, @encryptor.create_shift("02715", "1025", :A)
    assert_equal 73, @encryptor.create_shift("02715", "1025", :C)
    assert_equal 27, @encryptor.create_shift("02715", "1025", :B)
    assert_equal 20, @encryptor.create_shift("02715", "1025", :D)
  end

  def test_it_has_an_a_shift
    assert_equal "k", @encryptor.a_shift("02715", "1025", "h")
  end

  # def test_it_can_encrypt
  #   assert_equal "keder ohulw", @encryptor.encrypt
  # end


end

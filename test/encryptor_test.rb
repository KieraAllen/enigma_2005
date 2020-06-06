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
    assert_equal "hello world", @encryptor.message
    assert_equal "02715", @encryptor.key
    assert_equal "040895", @encryptor.date
  end

  # def test_it_can_encrypt
  #   assert_equal "keder ohulw", @encryptor.encrypt
  # end

  def test_it_can_create_offsets
    assert_equal "1025", @encryptor.create_offsets
  end
end

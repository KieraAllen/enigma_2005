require_relative 'test_helper'
require 'date'
require './lib/encryptor'

class EncryptorTest < Minitest::Test

  def setup
    @encryptor = Encryptor.new("hello world", "02715", "060620")
  end

  def test_it_exists
    assert_instance_of Encryptor, @encryptor
  end

  def test_it_can_read_attributes
    assert_equal "hello world", @encryptor.message
    assert_equal "02715", @encryptor.key
    assert_equal "060620", @encryptor.date
  end
end

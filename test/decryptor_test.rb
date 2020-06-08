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
end

require_relative 'test_helper'
require './lib/key'

class KeyTest < Minitest::Test

  def test_it_generates_random_key
    assert_instance_of String, Key.generate
    assert_equal 5, Key.generate.length
  end
end

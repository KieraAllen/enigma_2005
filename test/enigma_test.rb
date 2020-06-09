require_relative 'test_helper'
require 'date'
require './lib/enigma'

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_it_can_encrypt
    expected = {
        encryption: "keder ohulw",
        key: "02715",
        date: "040895"
      }
    assert_equal expected, @enigma.encrypt("hello world", "02715", "040895")
  end

  def test_it_can_decrypt
    expected = {
        decryption: "hello world",
        key: "02715",
        date: "040895"
      }
    assert_equal expected, @enigma.decrypt("keder ohulw", "02715", "040895")
  end

  def test_it_can_get_todays_date
    Date.stubs(:today).returns(Date.new(2020,6,8))

    assert_equal "060820", @enigma.todays_date
  end

  def test_it_can_encrypt_with_key
    @enigma.stubs(:todays_date).returns("060820")

    expected = {
      encryption: "lib sdmcvpu",
      key: "02715",
      date: "060820"
    }
    assert_equal expected, @enigma.encrypt("hello world", "02715")
  end

  def test_it_can_decrypt_with_key
    @enigma.stubs(:todays_date).returns("060820")

    expected = {
      decryption: "hello world",
      key: "02715",
      date: "060820"
    }
    assert_equal expected, @enigma.decrypt("lib sdmcvpu", "02715")
  end

  def test_it_can_generate_random_key
    assert_instance_of String, @enigma.generate_random_key
    assert_equal 5, @enigma.generate_random_key.length
  end

  def test_it_can_encrypt_with_random_key
    assert_instance_of Hash, @enigma.encrypt("hello world")
    assert_instance_of String, @enigma.encrypt("hello world")[:encryption]
    assert_equal 11, @enigma.encrypt("hello world")[:encryption].length
    assert_instance_of String, @enigma.encrypt("hello world")[:key]
    assert_equal 5, @enigma.encrypt("hello world")[:key].length
    assert_instance_of String, @enigma.encrypt("hello world")[:date]
    assert_equal 6, @enigma.encrypt("hello world")[:date].length
  end
end

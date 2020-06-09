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

  #
  #   # encrypt a message with a key (uses today's date)
  #   # pry(main)> encrypted = enigma.encrypt("hello world", "02715")
  #   # #=> # encryption hash here
  #   #
  #   # #decrypt a message with a key (uses today's date)
  #   # pry(main) > enigma.decrypt(encrypted[:encryption], "02715")
  #   # #=> # decryption hash here
  #   #
  #   # # encrypt a message (generates random key and uses today's date)
  #   # pry(main)> enigma.encrypt("hello world")
  #   # #=> # encryption hash here
  # end
end

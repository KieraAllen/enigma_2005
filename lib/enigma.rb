require './lib/encryptor'
require 'date'

class Enigma

  def encrypt(message, key, date = todays_date)
    encryptor = Encryptor.new(message, key, date)
    {
      encryption: encryptor.encrypt,
      key: key,
      date: date
    }
  end

  def decrypt(message, key, date)
    decryptor = Decryptor.new(message, key, date)
    {
      decryption: decryptor.decrypt,
      key: key,
      date: date
    }
  end

  def todays_date
    today = Date.today
    today.strftime("%m%d%y")
  end
end

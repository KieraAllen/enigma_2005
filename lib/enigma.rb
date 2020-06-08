require './lib/encryptor'

class Enigma

  def encrypt(message, key, date)
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
end

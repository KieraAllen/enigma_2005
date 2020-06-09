require './lib/enigma'


enigma = Enigma.new

ARGV == ["message_file", "decrypted_file", "key", "date"]
message_file = File.open(ARGV[0], "r")
decrypted_file = File.open(ARGV[1], "w")
key = ARGV[2]
date = ARGV[3]

message = message_file.read.chomp

decryption = enigma.decrypt(message)

decrypted_file.write(decryption[:decryption])

decrypted_file_name = ARGV[1]
key = decryption[:key]
date = decryption[:date]

puts "Create #{decrypted_file_name} with the key #{key} and date #{date}"

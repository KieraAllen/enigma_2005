require './lib/enigma'


enigma = Enigma.new

message_file = File.open(ARGV[0], "r")
encrypted_file = File.open(ARGV[1], "w")

message = message_file.read.chomp

encryption = enigma.encrypt(message)

encrypted_file.write(encryption[:encryption])

encrypted_file_name = ARGV[1]
key = encryption[:key]
date = encryption[:date]

puts "Create #{encrypted_file_name} with the key #{key} and date #{date}"

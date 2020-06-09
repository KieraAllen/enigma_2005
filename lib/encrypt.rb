require './lib/enigma'


enigma = Enigma.new

ARGV == ["message_file", "encrypted_file", "key", "date"]
message_file = File.open(ARGV[0], "r")
encrypted_file = File.open(ARGV[1], "w")
key = ARGV[2] if ARGV[2]
date = ARGV[3] if ARGV[3]

message = message_file.read.chomp
if key && date
  encryption = enigma.encrypt(message, key, date)
elsif key
  encryption = enigma.encrypt(message, key)
else
  encryption = enigma.encrypt(message)
end

encrypted_file.write(encryption[:encryption])

encrypted_file_name = ARGV[1]
key = encryption[:key]
date = encryption[:date]

puts "Create #{encrypted_file_name} with the key #{key} and date #{date}"

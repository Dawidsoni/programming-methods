require_relative("EncryptedText")
require_relative("DecryptedText")

char_map = {'a' => 'b', 'b' => 'r',  'r' => 'y',  'y' => 'u',  'u' => 'a'}
text = EncryptedText.new("ruby")
puts(text)
text = text.decrypt(char_map)
puts(text)
text = text.encrypt(char_map)
puts(text)

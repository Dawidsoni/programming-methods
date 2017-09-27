class DecryptedText
  def initialize(text)
    @text = text
  end

  def encrypt(char_map)
    rev_char_map = {}
    char_map.each {|key, val| rev_char_map[val] = key}
    encrypted = @text.chars.map {|ch| rev_char_map[ch]}
    return EncryptedText.new(encrypted.join())
  end

  def to_s()
    return @text
  end
end

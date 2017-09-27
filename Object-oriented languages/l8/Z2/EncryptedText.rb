class EncryptedText
  def initialize(text)
    @text = text
  end

  def decrypt(char_map)
    decrypted = @text.chars.map {|ch| char_map[ch]}
    return DecryptedText.new(decrypted.join())
  end

  def to_s()
    return @text
  end
end

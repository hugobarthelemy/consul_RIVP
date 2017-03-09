class AesEncryptDecrypt
  KEY = '12345678901234567890123456789012'
  CIPHER_METHOD = 'AES-256-CBC'

  def self.encrypt(str)
    cipher = OpenSSL::Cipher.new(CIPHER_METHOD)
    cipher.encrypt
    cipher.key = KEY
    data = cipher.update(str) + cipher.final
    return Base64.urlsafe_encode64(data)
  end
  def self.decrypt(str)
    data = Base64.urlsafe_decode64(str)
    cipher = OpenSSL::Cipher.new(CIPHER_METHOD)
    cipher.decrypt
    cipher.key = KEY
    return cipher.update(data) + cipher.final
  end
end

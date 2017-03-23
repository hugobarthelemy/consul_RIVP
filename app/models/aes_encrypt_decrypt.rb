class AesEncryptDecrypt
  # SSO_KEY = ENV["SSO_KEY"]
  CIPHER_METHOD = 'AES-256-CBC'

  def self.ssoencrypt(str)
    # binding.pry
    cipher = OpenSSL::Cipher.new(CIPHER_METHOD)
    cipher.encrypt
    cipher.key = ENV[:sso_key]
    data = cipher.update(str) + cipher.final
    return Base64.urlsafe_encode64(data)
  end
  def self.ssodecrypt(str)
    data = Base64.urlsafe_decode64(str)
    cipher = OpenSSL::Cipher.new(CIPHER_METHOD)
    cipher.decrypt
    cipher.key = ENV[:sso_key]
    return cipher.update(data) + cipher.final
  end
end

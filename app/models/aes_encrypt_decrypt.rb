class AesEncryptDecrypt
  # require ‘openssl’
  # require ‘base64’

  KEY = "9F6136DAAFCDF718"
  ALGORITHM = "AES-128-CBC"

  def self.encryption(msg)
    begin
      cipher = OpenSSL::Cipher.new(ALGORITHM)
      cipher.encrypt()
      cipher.key = KEY
      crypt = cipher.update(msg) + cipher.final()
      crypt_string = (Base64.encode64(crypt))
      return crypt_string
      rescue Exception => exc
      # puts (“Message for the encryption log file for message #{msg} = #{exc.message}”)
    end
  end

  def self.decryption(msg)
    begin
      cipher = OpenSSL::Cipher.new(ALGORITHM)
      cipher.decrypt()
      cipher.key = KEY
      tempkey = Base64.decode64(msg)
      crypt = cipher.update(tempkey)
      crypt << cipher.final()
      return crypt
      rescue Exception => exc
      # puts (“Message for the decryption log file for message #{msg} = #{exc.message}”)
    end
  end
end

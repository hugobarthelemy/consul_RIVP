require 'uri'
class Users::SessionsController < Devise::SessionsController
  def connect
    # reception of URL
    @string_crypt_escape = params[:string].to_s # string = ESI + n°contrat
    @string_crypt_unescape = CGI::unescape(@string_crypt_escape)
    # encryption URL for the test
      @exemple_encrypte = AesEncryptDecrypt.encryption("014203H00021-80031")
      @exemple_encrypte_encode = CGI::escape(@exemple_encrypte)
    # uncryption of URL
      @string_decrypt = AesEncryptDecrypt.decryption(@string_crypt_unescape)
    # test format
      if @string_decrypt =~ /^\d\d\d\d\d\dH\d\d\d\d\d-\d\d\d\d\d$/
        # mettr en variable
          #  esi
            @esi = @string_decrypt[0..5]
          # apartment number
            @apartment_number = @string_decrypt[7..11]
          #  n° contrat
            @contract =  @string_decrypt[13..17]

        # user research

        @user_with_good_esi = User.where(esi: @esi)
        @user_with_good_esi_and_good_contract = @user_with_good_esi.where(contract: 2)

      if @user_with_good_esi_and_good_contract != []
        @id = @user_with_good_esi_and_good_contract[:id]
        # sign in
        @sortie = "utilisateur existant maintenant connecté"
        # new_user_session_path(user_id: @user_with_good_esi_and_good_contract)
        sign_in(User.find(@id), scope: :user)
      else
        # creat user
          # identification of geozone
            case @esi
            when "014203", "074132", "214505", "214522"
              @site = "La Grange aux Belles"
            when "214526", "214536", "214538", "214539"
              @site = "La Chapelle Evangile"
            when "214501"
              @site = "Porte de Vanves"
            when "214502", "214509"
              @site = "Les cardeurs – Mouraud"
            when "014026", "014082", "014086", "014199", "074027", "014159", "074015", "014047", "074004", "015147", "014158", "074007", "014034", "014077", "014078", "014097", "074193", "014040", "014165", "015139", "074006", "074010", "074009"
              @site = "Bisson Ramponneau"
            when "014223", "014233", "014243"
              @site = "Bd Macdonald"
            when "007092"
              @site = "Elie Faure /Cdt l’Herminier"
            when "215522"
              @site = "Jean Bouton"
            when "214510"
              @site = "Zac Vaugirard"
            when "008005", "008012", "014850", "015097"
              @site = "Nationale"
            end
            @sortie = "utilisateur est créé mais pas encore connecté"
          # formulaire information utilisateur
            # nom prénom email et téléphone
          # créer l'utilisateur
          # def create_user(email, username = Faker::Name.name)
          #   pwd = '12345678'
          #   puts "    #{username}"
          #   User.create!(username: username, email: email, password: pwd, password_confirmation: pwd, confirmed_at: Time.current, terms_of_service: "1")
          # end
          # user = create_user('hugo@consul.dev', 'hugo')
          # user.update(residence_verified_at: Time.current,
          #   confirmed_phone: Faker::PhoneNumber.phone_number,
          #   document_type: "1",
          #   verified_at: Time.current,
          #   document_number: "3333333333")
          # user.update(verified_at: Time.current)

          # # connecter l'utilisateur
          #   @sortie = "utilisateur connecté"
      end
    else
    end
  end

  private

    def after_sign_in_path_for(resource)
      if !verifying_via_email? && resource.show_welcome_screen?
        welcome_path
      else
        super
      end
    end

    def after_sign_out_path_for(resource)
      request.referrer.present? ? request.referrer : super
    end

    def verifying_via_email?
      return false unless resource.present?
      stored_path = session[stored_location_key_for(resource)] || ""
      stored_path[0..5] == "/email"
    end
end

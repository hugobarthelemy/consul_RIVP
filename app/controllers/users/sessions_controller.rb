class Users::SessionsController < Devise::SessionsController
    # require ‘openssl’
    # require ‘base64’

    def connect
    # récupération de la requette
    @string = params[:string].to_s # string = ESI + contrat
    # encryption pour test
      @test_encrypt = AesEncryptDecrypt.encryption(@string)
      # => “rUPKObydUJd9cY9agm3Glw==\n”
    # décryptage de la requette
      @test_decrypt = AesEncryptDecrypt.decryption(@test_encrypt)
      # => “gurudath”
    # vérification du format
    # mettr en variable
      # prendre les derniers caractères

      #  esi
        # les 5 premiers caractères
      #  n° contrat
        # les x dernier
    # if utilisateur existant
    esi = 3
    @user_with_good_esi = User.where(esi: esi)
    @user_with_good_esi_and_good_contract = @user_with_good_esi.where(contract: 2)
    # SELECT * FROM users WHERE contract = contract

      # utilisateur existant
        # connecter l'utilisateur
          @sortie = "utilisateur existant maintenant connecté"
      # nouvel utilisateur
        # identification du site
          case esi
          when "014203", "074132", "214505", "214522"
            site = "La Grange aux Belles"
          when "214526", "214536", "214538", "214539"
            site = "La Chapelle Evangile"
          when "214501"
            site = "Porte de Vanves"
          when "214502", "214509"
            site = "Les cardeurs – Mouraud"
          when "014026", "014082", "014086", "014199", "074027", "014159", "074015", "014047", "074004", "015147", "014158", "074007", "014034", "014077", "014078", "014097", "074193", "014040", "014165", "015139", "074006", "074010", "074009"
            site = "Bisson Ramponneau"
          when "014223", "014233", "014243"
            site = "Bd Macdonald"
          when "007092"
            site = "Elie Faure /Cdt l’Herminier"
          when "215522"
            site = "Jean Bouton"
          when "214510"
            site = "Zac Vaugirard"
          when "008005", "008012", "014850", "015097"
            site = "Nationale"
          end
          @sortie = "utilisateur est créé mais pas encore connecté"
        # formulaire information utilisateur
        # créer l'utilisateur
        # connecter l'utilisateur
          @sortie = "utilisateur connecté"
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

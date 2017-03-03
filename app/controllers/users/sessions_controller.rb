class Users::SessionsController < Devise::SessionsController
    def connect
    # récupération de la requette
    @string = params[:string].to_s # string = ESI + contrat

    # décryptage de la requette
    # vérification du format
    # if utilisateur existant
      # utilisateur existant
        # connecter l'utilisateur
      # nouvel utilisateur
        # identification du site
        # formulaire information utilisateur
        # créer l'utilisateur
        # connecter l'utilisateur
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

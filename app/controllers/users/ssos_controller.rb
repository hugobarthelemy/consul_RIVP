class SsosController < Users::SessionsController
  def connect
    @string = params[:string].to_s # string = ESI + contrat
  end
end
# récupération de la requette
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

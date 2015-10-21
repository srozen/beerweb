module SessionsHelper

  # On place un token comme cookie sur le navigateur du User afin de garder une trace de ce dernier
  def login(user)
    cookies.permanent.signed[:remembered_token] = [user.id, user.salt]
    self.current_user = user
  end

  # On vérifie si le user est connecté
  def login?
    !current_user.nil?
  end

  # Assignement de current_user.
  def current_user=(user)
    # Appelle user_from_remember_token que la première fois que current_user est appelé
    @current_user ||= user_from_remember_token
  end

  private

    def user_from_remember_token
      User.authenticate_with_salt(*remembered_token)
    end

    def remembered_token
      # on retourne un tableau de valeurs null si l'argument de gauche est nil
      cookies.signed[:remember_token] || [nil, nil]
    end

end

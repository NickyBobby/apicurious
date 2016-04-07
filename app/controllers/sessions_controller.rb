class SessionsController < ApplicationController
  def create
    # render JSON: request.env["omniauth.auth"]
    auth = request.env["omniauth.auth"]
    if user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
      session[:user_id] = user.id
      redirect_to user_path(user.username)
    else
      redirect_to root_path
    end
  end

  def destroy
    session.clear
    redirect_to root_url, :notice => "Signed out!"
  end
end

class SessionsController < ApplicationController
  def create
    if user = User.from_omniauth(request.env["omniauth.auth"])
      session[:user_id] = user.id
      redirect_to dashboard_index_path
    else
      render_template root_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end

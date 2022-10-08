class SessionsController < ApplicationController
  def new
  end

  def create
    auth = request.env["omniauth.auth"]

    unless auth.credentials.active_member?
      render plain: "Unauthorized", status: 401
      return false
    end

    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
    log_in user
    redirect_to projects_url
  end

  def login_with_passwd_auth
    user = User.find_by(name: params[:name], provider: "local")
    if user && user.authenticate(params[:password])
      log_in user
      flash[:success] = "ログインに成功しました"
      redirect_to users_path
    else
      flash[:danger] = 'nameかpasswordが間違っています'
      redirect_to projects_url
    end
  end

  def destroy
    log_out
    redirect_to projects_url
  end

end

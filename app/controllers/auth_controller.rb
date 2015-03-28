class AuthController < ApplicationController
  
  def signin
    email = params[:email]
    if !email
      render :json => { :status => :bad_request, :message => "Email required" }
      return
    end
    password = params[:password]
    if !password
      render :json => { :status => :bad_request, :message => "Password required" }
      return
    end
    # Checking credentials
    user = User.find_by(email: email)
    if !user
      render :json => { :status => :not_found, :message => "Not existing user" }
      return
    end
    user.save # Force token generation
    if user.valid_password?(password)
      render :json => { :status => :ok, :token => user.authentication_token }
      return
    else
      render :json => { :status => :unauthorized, :message => "Invalid password" }
      return
    end
  end

  def signup
    byebug
  end

end

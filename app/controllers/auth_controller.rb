class AuthController < ApplicationController
  
  def signin
    email = params[:email]
    if !email
      render :json => { :status => :bad_request, :message => "Email required" }, :status => :bad_request
      return
    end
    password = params[:password]
    if !password
      render :json => { :status => :bad_request, :message => "Password required" }, :status => :bad_request
      return
    end
    # Checking credentials
    user = User.find_by(email: email)
    if !user
      render :json => { :status => :not_found, :message => "Not existing user" }, :status => :not_found
      return
    end
    user.save # Force token generation
    if user.valid_password?(password)
      render :json => { :status => :ok, :token => user.authentication_token }
      return
    else
      render :json => { :status => :unauthorized, :message => "Invalid password" }, :status => :unauthorized
      return
    end
  end

  def signup
    byebug
    email = params[:email]
    password = params[:password]
    name = params[:name]

    # Validation
    if !email
      render :json => { :status => :bad_request, :message => "Email required" }, :status => :bad_request
      return
    end
    if !password
      render :json => { :status => :bad_request, :message => "Password required" }, :status => :bad_request
      return
    end
    if !name
      render :json => { :status => :bad_request, :message => "Name required" }, :status => :bad_request
      return
    end

    user = User.where(email: email).first
    if user
      render :json => { :status => :bad_request, :message => "Existing user" }, :status => :bad_request
      return
    end

    user = User.new
    user.email = email
    user.password = password
    user.name = name
    user.add_role :tech

    if user.save
      render :json => { :status => :ok, :token => user.authentication_token }
    else
      render :json => { :status => :server_error, :message => "Something went wrong creating user" }
      return
    end

  end

end

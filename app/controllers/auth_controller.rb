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
      render :json => { :status => 401, :message => "Invalid password" }
      return
    end
  end

  def signup
    email = params[:email]
    password = params[:password]
    name = params[:name]

    # Validation
    if !email
      render :json => { :status => :bad_request, :message => "Email required" }
      return
    end
    if !password
      render :json => { :status => :bad_request, :message => "Password required" }
      return
    end
    if !name
      render :json => { :status => :bad_request, :message => "Name required" }
      return
    end

    user = User.find_by(email: email)
    if user
      render :json => { :status => :bad_request, :message => "Existing user" }
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

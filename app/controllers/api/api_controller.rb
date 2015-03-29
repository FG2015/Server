module Api

  class ApiController < ApplicationController

    before_action :require_login

    def require_login
      if !current_user
        render :json => { :status => :unauthorized, :message => "Login first" }, :status => :unauthorized
      end
    end

    def current_user
      byebug
      email = request.headers['X-User-Email']
      token = request.headers['X-User-Token']
      return nil unless email
      return nil unless token
      user = User.where(email: email).first
      return nil unless user
      if user.authentication_token == token
        return user
      else 
        return nil
      end
    end

  end


end

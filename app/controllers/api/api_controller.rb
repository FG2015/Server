module Api

  class ApiController < ApplicationController
    acts_as_token_authentication_handler_for User, fallback_to_devise: false

    before_action :require_login

    def require_login
      if !current_user
        render :json => { :status => :unauthorized, :message => "Login first" }, :status => :unauthorized
      end
    end
  end


end

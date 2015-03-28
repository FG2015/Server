class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # http://billpatrianakos.me/blog/2013/10/13/list-of-rails-status-code-symbols/
  protect_from_forgery with: :null_session
end

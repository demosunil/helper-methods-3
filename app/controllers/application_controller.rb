class ApplicationController < ActionController::Base
  #before_action :force_user_sign_in
  before_action :authenticate_user!

  #def force_user_sign_in

    #if session[:user_id].present?
      #redirect_to "/users/sign_in"
    #end

  #end 
end

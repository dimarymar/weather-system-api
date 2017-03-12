module Devise
  class CustomSessionsController < Devise::SessionsController
    def create
      session[:user_id] = current_user.id
      super
    end

    def destroy
      session.delete(:user_id)
      super
    end
  end
end

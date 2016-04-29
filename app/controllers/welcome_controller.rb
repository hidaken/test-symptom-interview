class WelcomeController < ApplicationController
 def index
   unless logged_in?
    redirect_to login_path
   else
    
    redirect_to @current_user
   end
 end
end

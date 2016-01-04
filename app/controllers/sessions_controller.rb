class SessionsController < ApplicationController
    
    def new
        
    end
    
    def create
    user = User.find_by(email: params[:sessie][:email].downcase)
    if user && user.authenticate(params[:sessie][:password])
        session[:user_id] = user.id
        flash[:succes] = "U bent ingelogd!"
        redirect_to user_path(user)
    else
        flash.now[:danger] = "Er klopt iets niet!"
        render 'new'
    # debugger
    end
    
    def destroy
        
    end
    
end
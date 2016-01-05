class SessionsController < ApplicationController
    
    def new
        
    end
    
    def create
    user = User.find_by(email: params[:sessie][:email].downcase)
    if user && user.authenticate(params[:sessie][:password])
        session[:user_id] = user.id
        flash[:success] = "U bent ingelogd!"
        redirect_to user_path(user)
    else
        flash.now[:danger] = "Er klopt iets niet met uw login gegevens!"
        render 'new'
    # debugger
    end
    end
    
    def destroy
    session[:user_id] = nil
    flash[:success] = "U bent uitgelogd!"
    redirect_to root_path
    end
    
end
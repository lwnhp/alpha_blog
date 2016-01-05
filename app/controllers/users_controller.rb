class UsersController < ApplicationController
    
    before_action :set_user, only: [:edit, :update, :show, :destroy] # zie hieronder priv. method set_user -> vult def edit, update en show met @user = User.find(params[:id])
    before_action :require_user, except: [:create, :new]
    before_action :require_same_user, only: [:edit, :update]
    before_action :require_admin, only: [:destroy]

    def index
        @users = User.paginate(page: params[:page], per_page: 5)
    end
    
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            flash[:success] = "Welkom op het Alpha Blog #{@user.username}"
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render 'new'
        end
    end
    
    def edit
        
    end
    
    def update
        
        if @user.update(user_params)
            flash[:success] = "Your account was updated succesfully!"
            redirect_to articles_path
        end
    end
    
    def show
        
        @user_artikelen = @user.articles.paginate(page: params[:page], per_page: 5)
    end
    
    def destroy
        flash[:danger] = "user #{@user.username} and all his/her articles have been deleted"
        @user.destroy
        redirect_to users_path
    
    end
    
    def maak_admin
        flash[:success] = "user #{@user.username} is nu admin"
        redirect_to users_path
        
    end

    
private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
    
    def set_user
        @user = User.find(params[:id])
    end
    
    def require_same_user
        if current_user != @user
            flash[:danger] = "U kunt alleen uw eigen account aanpassen!"
         redirect_to user_path
        end
    end

    def require_admin
        if logged_in? and !current_user.admin?
            flash[:danger] = "Only admin users can perform that action!"
            redirect_to root_path
        end
    end
end
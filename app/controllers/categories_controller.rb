class CategoriesController < ApplicationController
    
    before_action :require_admin, only: [:create, :new]
    
    def index
        @categories = Category.paginate(page: params[:page], per_page: 5)
    end
    
    def new
        @category = Category.new
    end
    
    def create
        @category = Category.new(category_params)
        if @category.save
                flash[:success] = "Categorie \"#{@category.name}\" is aangemaakt!"
                redirect_to categories_path
            else
                render 'new'
        end
        
    end
    
    def show
        
    end
    
    private
    
    def category_params
        params.require(:category).permit(:name)
    end
    
    def require_admin
      if !logged_in? or (logged_in? and !current_user.admin?)
        flash[:danger] = "Alleen admins mogen nieuwe categorieën definiëren!"
        redirect_to root_path
      end
    end

    
    
    
end
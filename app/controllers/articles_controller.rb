class ArticlesController < ApplicationController
 before_action :set_artikel, only: [:edit, :update, :show, :destroy]
 # before_action :require_user, except: [:index, :show]
 before_action :require_same_user, only: [:edit, :update, :destroy]
   
   def destroy
        # replaced by set_artikel before action --> @article = Article.find(params[:id])
      @article.destroy
      flash[:danger] = "Artikel verwijderd!!"
        # redirect_to articles_path
      respond_to do |wants|
        wants.html { redirect_to(articles_url) }
        wants.xml  { head :ok }
      end
   end
   
   def index
    @articles = Article.paginate(page: params[:page], per_page: 5)
   end
   
   def new
    @article = Article.new   
   end
   
   def edit
    # replaced by set_artikel before action --> @article = Article.find(params[:id])
   end
   
   def update
    # replaced by set_artikel before action --> @article = Article.find(params[:id])
    if @article.update(article_params)
     flash[:success] = "Artikel succesvol aangepast!"
     redirect_to article_path(@article)
    else
     render 'edit'
    end
   end
   
   def create
    # debugger
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
     flash[:success] = "Artikel succesvol aangemaakt"
     redirect_to article_path(@article)
    else
     render 'new'
     
    end
   end
   
   def show
    # replaced by set_artikel before action --> @article = Article.find(params[:id])
   end
   
   
  private
  
  def set_artikel
  @article = Article.find(params[:id])
  end
 
  def article_params
   params.require(:article).permit(:title, :description)
  end

  def require_same_user
     if current_user != @article.user and !current_user.admin?
        flash[:danger] = "U kunt alleen uw eigen artikelen aanpassen of verwijderen!"
        redirect_to article_path
     end
  end
  
end
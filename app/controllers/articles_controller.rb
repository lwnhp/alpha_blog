class ArticlesController < ApplicationController
 before_action :set_artikel, only: [:edit, :update, :show, :destroy]
 
   
   def destroy
    # replaced by set_artikel before action --> @article = Article.find(params[:id])
    @article.destroy
    flash[:notice] = "Artikel verwijderd!!"
    # redirect_to articles_path
    respond_to do |wants|
     wants.html { redirect_to(articles_url) }
     wants.xml  { head :ok }
    end
   end
   
   def index
    @articles = Article.all
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
     flash[:notice] = "Artikel succesvol aangepast!"
     redirect_to article_path(@article)
    else
     render 'edit'
    end
   end
   
   def create
    @article = Article.new(article_params)
    if @article.save
     flash[:notice] = "Artikel succesvol aangemaakt"
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

end
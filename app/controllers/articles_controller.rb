class ArticlesController < ApplicationController
   
   def destroy
    @article = Article.find(params[:id])
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
    @article = Article.find(params[:id])
   end
   
   def update
    @article = Article.find(params[:id])
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
    @article = Article.find(params[:id])
   end
   
   
 private
  def article_params
      params.require(:article).permit(:title, :description)
  
  end

end
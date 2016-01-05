class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :current_user, :logged_in?
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id] # ||= Betekent: return @current_user indien die bestaat, 
                                                                        #     anders zoek (en vul) @current_user via :session (als die er is)
  end
  
  def logged_in?
    !!current_user # !! converteert alles naar een boolean (in dit geval @current_user). return -> false/true: géén/wel @current_user
                   #     Zie http://rubyquicktips.com/post/583755021/convert-anything-to-boolean
  end
  
  def require_user
    if !logged_in? # if NOT logged_in?
    flash[:danger] = "U moet ingelogd zijn to perform that action!"
    redirect_to root_path
    end
  end
  
  def require_same_user
  if current_user != @article.user and !current_user.admin?
    flash[:danger] = "U kunt alleen uw eigen artikelen aanpassen of verwijderen!"
    redirect_to article_path
  end
    
  end
end

require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
    
    def setup       # method mag geen andere naam dan 'setup' hebben, anders werkt het niet ... #
        @category = Category.create(name: "sport")
        @user = User.create(:username => "xyz", :email => 'xyz@xyz.nl', :password => 'password', :admin => true)
    end
    
    test "Zou get index view moeten geven." do
        get :index
        assert_response :success
    end
    
    test "Zou get new moeten geven." do
        get :new
        assert_response :success
    end
    
    test "Zou get show moeten geven." do
        session[:user_id] = @user.id # dit simuleert dat @user (=admin) ingelogd is, d.w.z. sessie-id wordt hiermee gezet.
        get(:show, {'id' => @category.id}, nil, {'message' => 'booya!'})
        assert_response :success
    end
    
    
    
end
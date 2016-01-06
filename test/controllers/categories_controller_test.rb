require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
    
    def setup       # method mag geen andere naam dan 'setup' hebben, anders werkt het niet ... #
        @category = Category.create(name: "sport")
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
        get(:show, {'id' => @category.id}, nil, {'message' => 'booya!'})
        assert_response :success
    end
    
    
    
end
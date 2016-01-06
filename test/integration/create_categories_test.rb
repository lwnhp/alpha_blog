require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest
    
    test "geef 'new-categorie'-formulier en actie 'create category'" do
        get new_category_path
        assert_template 'categories/new'
        assert_difference 'Category.count', 1 do    # het aantal categorie-objecten moet met één worden verhoogd, i.e. er wordt een cat.obj. aangemaakt. #
                post_via_redirect categories_path, category: {name: "sport"}
            end
        assert_template 'categories/index'
        assert_match "sport", response.body  # controleren of het woord "sport" op de index-pagina voorkomt. #
        
    end
    
    test "invalid submission gives failure" do
        get new_category_path
        assert_template 'categories/new'
            assert_no_difference 'Category.count', 1 do    # het aantal categorie-objecten mag NIET met één worden verhoogd, i.e. er wordt géén cat.obj. aangemaakt. #
                post categories_path, category: {name: " "}
            end
        assert_template 'categories/new' # de new-pagina wordt opniew gerenderd cf. categories_controller-->create #
        assert_select 'h2.panel-title' # zie html css in de errors-partial. De test slaagt indien deze elementen worden gevonden. #
        assert_select 'div.panel-body'
    end
    
end
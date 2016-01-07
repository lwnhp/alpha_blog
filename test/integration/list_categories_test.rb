require 'test_helper'

class ListCategoriesTest < ActionDispatch::IntegrationTest
    
    def setup
        @category1 = Category.create(:name => "onderwijs")
        @category2 = Category.create(:name => "vakantie")
    end
    
    test "zou de categorie lijst moeten laten zien" do
        get categories_path # de route moet kloppen
        assert_template 'categories/index' # de view moet kloppen
        assert_select "a[href=?]", category_path(@category1), text: "#{@category1.name}" # kijkt naar een link naar de cat.1 view #
        assert_select "a[href=?]", category_path(@category2), text: "#{@category2.name}" # idem maar dan voor cat.2 #
    end
    
     #test "zou create-new-category moeten redirecten indien user géén admin is" do
     #  assert_no_difference 'Category.count' do
     #      post new_category_path, :create, category: { name: "sport"}
     #  end
     #  assert_redirected_to root_path
     #end
    
    
    
end
require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

    def setup
        @category = Category.new(name: "sport")
    end
    
    test "category moet valid zijn." do # tip: google "assertions" 
        assert @category.valid?
    end
    
    test "name moet gevuld zijn." do
        @category.name = ""
        assert_not @category.valid?
    end
    
    test "name moet uniek zijn." do
        @category.save
        category2 = Category.new(name: "sport")
        assert_not category2.valid?
    end
    
    test "naam zou niet te lang mogen zijn." do
        @category.name = "a" * 26
        assert_not @category.valid?
    end
    
    test "naam zou niet te kort mogen zijn." do
        @category.name = "aa"
        assert_not @category.valid?
    end
    
end
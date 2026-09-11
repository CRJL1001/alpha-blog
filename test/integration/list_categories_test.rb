require "test_helper"

class ListCategoriesTest < ActionDispatch::IntegrationTest
  def setup 
    @category = Category.create(name: "Sports")
    @category2 = Category.create(name: "Nature")
  end

  test "Should show categories listing" do
    #test de listing
    get "/categories"
    assert_select "a[href=?]", category_path(@category), text: @category.name #test si un lien qui a pour lien la catégorie et comme text le nom de celle-ci est présent
    assert_select "a[href=?]", category_path(@category2), text: @category2.name
  end
end


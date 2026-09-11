require "test_helper"

class CreateCategoryTest < ActionDispatch::IntegrationTest
  setup do 
    @admin_user = User.create(username: "admintest", email: "admintest@exemple.fr", password: "Test1234--?", admin: true)
  end

  test "get new category form and create category" do
    sign_in_as(@admin_user)
    #test d'accès au formulaire
    get "/categories/new" #accède à la page new
    assert_response :success #vérifie que la réponse est OK

    #test de création
    assert_difference 'Category.count', 1 do # Vas vérifié que après la boucle le nbr de catégorie sera augmenter de 1
      post categories_path, params: {category: { name: "Sports" }} #requête de création d'une catégorie

      #test de redirection
      assert_response :redirect #vérifie que la réponse de redirection est OK
    end
    follow_redirect! #suit la redirection
    assert_response :success #réponse de la page de redirection OK
    assert_match "Sports", response.body #vérifie que le nom de la category est présent quelque part dans le html.body
  end

  test "get new category form and rejecte invalid category submission" do
    sign_in_as(@admin_user)
    #test d'accès au formulaire
    get "/categories/new" #accède à la page new
    assert_response :success #vérifie que la réponse est OK

    #test de création
    assert_no_difference 'Category.count' do # Vas vérifié que après la boucle le nbr de catégorie ne changera pas
      post categories_path, params: {category: { name: "" }} #requête de création d'une catégorie au nom vide
    end
    #test affichage erreurs
    assert_match "impossible(s)", response.body #présence de impossible(s) dans le body
    assert_select "div.alert" #présence d'une div avec la classe alert
    assert_select "h4.alert-heading" #présence d'un h4 avec la classe alert-heading
  end

end

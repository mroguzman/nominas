require 'test_helper'

class ProfessionalCategoriesControllerTest < ActionController::TestCase
  setup do
    @professional_category = professional_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:professional_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create professional_category" do
    assert_difference('ProfessionalCategory.count') do
      post :create, professional_category: { name: @professional_category.name }
    end

    assert_redirected_to professional_category_path(assigns(:professional_category))
  end

  test "should show professional_category" do
    get :show, id: @professional_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @professional_category
    assert_response :success
  end

  test "should update professional_category" do
    put :update, id: @professional_category, professional_category: { name: @professional_category.name }
    assert_redirected_to professional_category_path(assigns(:professional_category))
  end

  test "should destroy professional_category" do
    assert_difference('ProfessionalCategory.count', -1) do
      delete :destroy, id: @professional_category
    end

    assert_redirected_to professional_categories_path
  end
end

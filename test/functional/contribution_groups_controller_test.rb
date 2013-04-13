require 'test_helper'

class ContributionGroupsControllerTest < ActionController::TestCase
  setup do
    @contribution_group = contribution_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contribution_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contribution_group" do
    assert_difference('ContributionGroup.count') do
      post :create, contribution_group: { name: @contribution_group.name }
    end

    assert_redirected_to contribution_group_path(assigns(:contribution_group))
  end

  test "should show contribution_group" do
    get :show, id: @contribution_group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @contribution_group
    assert_response :success
  end

  test "should update contribution_group" do
    put :update, id: @contribution_group, contribution_group: { name: @contribution_group.name }
    assert_redirected_to contribution_group_path(assigns(:contribution_group))
  end

  test "should destroy contribution_group" do
    assert_difference('ContributionGroup.count', -1) do
      delete :destroy, id: @contribution_group
    end

    assert_redirected_to contribution_groups_path
  end
end

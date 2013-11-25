require 'test_helper'

class SubfamiliesControllerTest < ActionController::TestCase
  setup do
    @subfamily = subfamilies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subfamilies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subfamily" do
    assert_difference('Subfamily.count') do
      post :create, subfamily: { branch_id: @subfamily.branch_id, client_branch_id: @subfamily.client_branch_id, client_id: @subfamily.client_id, company_id: @subfamily.company_id, description: @subfamily.description, family_id: @subfamily.family_id, name: @subfamily.name }
    end

    assert_redirected_to subfamily_path(assigns(:subfamily))
  end

  test "should show subfamily" do
    get :show, id: @subfamily
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @subfamily
    assert_response :success
  end

  test "should update subfamily" do
    patch :update, id: @subfamily, subfamily: { branch_id: @subfamily.branch_id, client_branch_id: @subfamily.client_branch_id, client_id: @subfamily.client_id, company_id: @subfamily.company_id, description: @subfamily.description, family_id: @subfamily.family_id, name: @subfamily.name }
    assert_redirected_to subfamily_path(assigns(:subfamily))
  end

  test "should destroy subfamily" do
    assert_difference('Subfamily.count', -1) do
      delete :destroy, id: @subfamily
    end

    assert_redirected_to subfamilies_path
  end
end

require 'test_helper'

class ClientBranchesControllerTest < ActionController::TestCase
  setup do
    @client_branch = client_branches(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:client_branches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create client_branch" do
    assert_difference('ClientBranch.count') do
      post :create, client_branch: { address1: @client_branch.address1, address2: @client_branch.address2, branch_id: @client_branch.branch_id, city: @client_branch.city, client_id: @client_branch.client_id, company_id: @client_branch.company_id, contact: @client_branch.contact, country: @client_branch.country, description: @client_branch.description, email1: @client_branch.email1, email2: @client_branch.email2, fax: @client_branch.fax, latitude: @client_branch.latitude, longitude: @client_branch.longitude, name: @client_branch.name, phone1: @client_branch.phone1, phone2: @client_branch.phone2, state: @client_branch.state, webpage: @client_branch.webpage, zip: @client_branch.zip }
    end

    assert_redirected_to client_branch_path(assigns(:client_branch))
  end

  test "should show client_branch" do
    get :show, id: @client_branch
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @client_branch
    assert_response :success
  end

  test "should update client_branch" do
    patch :update, id: @client_branch, client_branch: { address1: @client_branch.address1, address2: @client_branch.address2, branch_id: @client_branch.branch_id, city: @client_branch.city, client_id: @client_branch.client_id, company_id: @client_branch.company_id, contact: @client_branch.contact, country: @client_branch.country, description: @client_branch.description, email1: @client_branch.email1, email2: @client_branch.email2, fax: @client_branch.fax, latitude: @client_branch.latitude, longitude: @client_branch.longitude, name: @client_branch.name, phone1: @client_branch.phone1, phone2: @client_branch.phone2, state: @client_branch.state, webpage: @client_branch.webpage, zip: @client_branch.zip }
    assert_redirected_to client_branch_path(assigns(:client_branch))
  end

  test "should destroy client_branch" do
    assert_difference('ClientBranch.count', -1) do
      delete :destroy, id: @client_branch
    end

    assert_redirected_to client_branches_path
  end
end

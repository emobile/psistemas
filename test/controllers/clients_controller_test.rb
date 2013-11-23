require 'test_helper'

class ClientsControllerTest < ActionController::TestCase
  setup do
    @client = clients(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:clients)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create client" do
    assert_difference('Client.count') do
      post :create, client: { address1: @client.address1, address2: @client.address2, branch_id: @client.branch_id, city: @client.city, company_id: @client.company_id, contact: @client.contact, country: @client.country, description: @client.description, email1: @client.email1, email2: @client.email2, fax: @client.fax, latitude: @client.latitude, longitude: @client.longitude, name: @client.name, phone1: @client.phone1, phone2: @client.phone2, state: @client.state, webpage: @client.webpage, zip: @client.zip }
    end

    assert_redirected_to client_path(assigns(:client))
  end

  test "should show client" do
    get :show, id: @client
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @client
    assert_response :success
  end

  test "should update client" do
    patch :update, id: @client, client: { address1: @client.address1, address2: @client.address2, branch_id: @client.branch_id, city: @client.city, company_id: @client.company_id, contact: @client.contact, country: @client.country, description: @client.description, email1: @client.email1, email2: @client.email2, fax: @client.fax, latitude: @client.latitude, longitude: @client.longitude, name: @client.name, phone1: @client.phone1, phone2: @client.phone2, state: @client.state, webpage: @client.webpage, zip: @client.zip }
    assert_redirected_to client_path(assigns(:client))
  end

  test "should destroy client" do
    assert_difference('Client.count', -1) do
      delete :destroy, id: @client
    end

    assert_redirected_to clients_path
  end
end

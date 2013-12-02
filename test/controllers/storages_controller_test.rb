require 'test_helper'

class StoragesControllerTest < ActionController::TestCase
  setup do
    @storage = storages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:storages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create storage" do
    assert_difference('Storage.count') do
      post :create, storage: { address1: @storage.address1, address2: @storage.address2, branch_id: @storage.branch_id, city: @storage.city, company_id: @storage.company_id, contact: @storage.contact, country: @storage.country, description: @storage.description, email1: @storage.email1, email2: @storage.email2, fax: @storage.fax, name: @storage.name, phone1: @storage.phone1, phone2: @storage.phone2, state: @storage.state, webpage: @storage.webpage, zip: @storage.zip }
    end

    assert_redirected_to storage_path(assigns(:storage))
  end

  test "should show storage" do
    get :show, id: @storage
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @storage
    assert_response :success
  end

  test "should update storage" do
    patch :update, id: @storage, storage: { address1: @storage.address1, address2: @storage.address2, branch_id: @storage.branch_id, city: @storage.city, company_id: @storage.company_id, contact: @storage.contact, country: @storage.country, description: @storage.description, email1: @storage.email1, email2: @storage.email2, fax: @storage.fax, name: @storage.name, phone1: @storage.phone1, phone2: @storage.phone2, state: @storage.state, webpage: @storage.webpage, zip: @storage.zip }
    assert_redirected_to storage_path(assigns(:storage))
  end

  test "should destroy storage" do
    assert_difference('Storage.count', -1) do
      delete :destroy, id: @storage
    end

    assert_redirected_to storages_path
  end
end

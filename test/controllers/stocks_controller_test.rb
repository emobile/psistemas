require 'test_helper'

class StocksControllerTest < ActionController::TestCase
  setup do
    @stock = stocks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stocks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stock" do
    assert_difference('Stock.count') do
      post :create, stock: { address1: @stock.address1, address2: @stock.address2, branch_id: @stock.branch_id, city: @stock.city, company_id: @stock.company_id, country: @stock.country, description: @stock.description, email1: @stock.email1, email2: @stock.email2, fax: @stock.fax, name: @stock.name, phone1: @stock.phone1, phone2: @stock.phone2, state: @stock.state, webpage: @stock.webpage, zip: @stock.zip }
    end

    assert_redirected_to stock_path(assigns(:stock))
  end

  test "should show stock" do
    get :show, id: @stock
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @stock
    assert_response :success
  end

  test "should update stock" do
    patch :update, id: @stock, stock: { address1: @stock.address1, address2: @stock.address2, branch_id: @stock.branch_id, city: @stock.city, company_id: @stock.company_id, country: @stock.country, description: @stock.description, email1: @stock.email1, email2: @stock.email2, fax: @stock.fax, name: @stock.name, phone1: @stock.phone1, phone2: @stock.phone2, state: @stock.state, webpage: @stock.webpage, zip: @stock.zip }
    assert_redirected_to stock_path(assigns(:stock))
  end

  test "should destroy stock" do
    assert_difference('Stock.count', -1) do
      delete :destroy, id: @stock
    end

    assert_redirected_to stocks_path
  end
end

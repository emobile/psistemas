require 'test_helper'

class CompaniesControllerTest < ActionController::TestCase
  setup do
    @company = companies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:companies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create company" do
    assert_difference('Company.count') do
      post :create, company: { address1: @company.address1, address2: @company.address2, city: @company.city, country: @company.country, description: @company.description, email1: @company.email1, email2: @company.email2, fax: @company.fax, name: @company.name, phone1: @company.phone1, phone2: @company.phone2, state: @company.state, webpage: @company.webpage, zip: @company.zip }
    end

    assert_redirected_to company_path(assigns(:company))
  end

  test "should show company" do
    get :show, id: @company
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @company
    assert_response :success
  end

  test "should update company" do
    patch :update, id: @company, company: { address1: @company.address1, address2: @company.address2, city: @company.city, country: @company.country, description: @company.description, email1: @company.email1, email2: @company.email2, fax: @company.fax, name: @company.name, phone1: @company.phone1, phone2: @company.phone2, state: @company.state, webpage: @company.webpage, zip: @company.zip }
    assert_redirected_to company_path(assigns(:company))
  end

  test "should destroy company" do
    assert_difference('Company.count', -1) do
      delete :destroy, id: @company
    end

    assert_redirected_to companies_path
  end
end

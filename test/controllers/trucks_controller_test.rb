require 'test_helper'

class TrucksControllerTest < ActionController::TestCase
  setup do
    @truck = trucks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trucks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create truck" do
    assert_difference('Truck.count') do
      post :create, truck: { branch_id: @truck.branch_id, brand: @truck.brand, color: @truck.color, company_id: @truck.company_id, identifier: @truck.identifier, model: @truck.model, other: @truck.other, plate_no: @truck.plate_no, serial_no: @truck.serial_no, truck_type: @truck.truck_type, wheels_no: @truck.wheels_no, year: @truck.year }
    end

    assert_redirected_to truck_path(assigns(:truck))
  end

  test "should show truck" do
    get :show, id: @truck
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @truck
    assert_response :success
  end

  test "should update truck" do
    patch :update, id: @truck, truck: { branch_id: @truck.branch_id, brand: @truck.brand, color: @truck.color, company_id: @truck.company_id, identifier: @truck.identifier, model: @truck.model, other: @truck.other, plate_no: @truck.plate_no, serial_no: @truck.serial_no, truck_type: @truck.truck_type, wheels_no: @truck.wheels_no, year: @truck.year }
    assert_redirected_to truck_path(assigns(:truck))
  end

  test "should destroy truck" do
    assert_difference('Truck.count', -1) do
      delete :destroy, id: @truck
    end

    assert_redirected_to trucks_path
  end
end

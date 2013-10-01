require 'test_helper'

class AircarftTypesControllerTest < ActionController::TestCase
  setup do
    @aircarft_type = aircarft_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:aircarft_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create aircarft_type" do
    assert_difference('AircarftType.count') do
      post :create, aircarft_type: {  }
    end

    assert_redirected_to aircarft_type_path(assigns(:aircarft_type))
  end

  test "should show aircarft_type" do
    get :show, id: @aircarft_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @aircarft_type
    assert_response :success
  end

  test "should update aircarft_type" do
    patch :update, id: @aircarft_type, aircarft_type: {  }
    assert_redirected_to aircarft_type_path(assigns(:aircarft_type))
  end

  test "should destroy aircarft_type" do
    assert_difference('AircarftType.count', -1) do
      delete :destroy, id: @aircarft_type
    end

    assert_redirected_to aircarft_types_path
  end
end

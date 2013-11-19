require 'test_helper'

class GuysControllerTest < ActionController::TestCase
  setup do
    @guy = guys(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:guys)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create guy" do
    assert_difference('Guy.count') do
      post :create, guy: {  }
    end

    assert_redirected_to guy_path(assigns(:guy))
  end

  test "should show guy" do
    get :show, id: @guy
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @guy
    assert_response :success
  end

  test "should update guy" do
    patch :update, id: @guy, guy: {  }
    assert_redirected_to guy_path(assigns(:guy))
  end

  test "should destroy guy" do
    assert_difference('Guy.count', -1) do
      delete :destroy, id: @guy
    end

    assert_redirected_to guys_path
  end
end

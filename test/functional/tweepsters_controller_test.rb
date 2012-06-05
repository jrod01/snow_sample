require 'test_helper'

class TweepstersControllerTest < ActionController::TestCase
  setup do
    @tweepster = tweepsters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tweepsters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tweepster" do
    assert_difference('Tweepster.count') do
      post :create, tweepster: { twitter_id: @tweepster.twitter_id, username: @tweepster.username }
    end

    assert_redirected_to tweepster_path(assigns(:tweepster))
  end

  test "should show tweepster" do
    get :show, id: @tweepster
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tweepster
    assert_response :success
  end

  test "should update tweepster" do
    put :update, id: @tweepster, tweepster: { twitter_id: @tweepster.twitter_id, username: @tweepster.username }
    assert_redirected_to tweepster_path(assigns(:tweepster))
  end

  test "should destroy tweepster" do
    assert_difference('Tweepster.count', -1) do
      delete :destroy, id: @tweepster
    end

    assert_redirected_to tweepsters_path
  end
end

require 'test_helper'

class IdeationSessionsControllerTest < ActionController::TestCase
  setup do
    @ideation_session = ideation_sessions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ideation_sessions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ideation_session" do
    assert_difference('IdeationSession.count') do
      post :create, ideation_session: { description: @ideation_session.description, name: @ideation_session.name }
    end

    assert_redirected_to ideation_session_path(assigns(:ideation_session))
  end

  test "should show ideation_session" do
    get :show, id: @ideation_session
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ideation_session
    assert_response :success
  end

  test "should update ideation_session" do
    patch :update, id: @ideation_session, ideation_session: { description: @ideation_session.description, name: @ideation_session.name }
    assert_redirected_to ideation_session_path(assigns(:ideation_session))
  end

  test "should destroy ideation_session" do
    assert_difference('IdeationSession.count', -1) do
      delete :destroy, id: @ideation_session
    end

    assert_redirected_to ideation_sessions_path
  end
end

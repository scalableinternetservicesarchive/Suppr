require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  include Warden::Test::Helpers
  Warden.test_mode!

  setup do
    @comment = comments(:comment_one)
    sign_in users(:one)
  end

  test "should create comment" do
    assert_difference('Comment.count') do
      post :create, comment: { content: @comment.content, dinner_id: @comment.dinner_id, user_id: @comment.user_id }
    end

    assert_redirected_to comment_path(assigns(:comment))
  end

  test "should get edit" do
    get :edit, id: @comment
    assert_response :success
  end

  #FIXME
  # test "should update comment" do
  #   patch :update, id: @comment, comment: { content: @comment.content, dinner_id: @comment.dinner_id, user_id: @comment.user_id }
  #   assert_redirected_to comment_path(assigns(:comment))
  # end

  # test "should destroy comment" do
  #   assert_difference('Comment.count', -1) do
  #     delete :destroy, id: @comment
  #   end

  #   assert_redirected_to comments_path
  # end
end

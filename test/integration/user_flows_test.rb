require "test_helper"

class UserFlowsTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "user should be able to create categories" do
    sign_in users(:Stephen)
    get new_category_path
    assert_response :success

    post categories_path, params: { category: {category_title: "Programming", category_description: "Tasks related to computer programming."}}
    assert_response :redirect
    follow_redirect!
    assert_select "td", "Programming"
  end

  # test "user should be able to create tasks" do
  #   sign_in users(:Stephen)
  #   get new_tasks_path
  #   assert_response :success

  #   post categories_path, params: { task: {task_title: "Rails App", description: "Rails app in fulfillment of Avion BE course."}}
  #   assert_response :redirect
  #   follow_redirect!
  #   assert_select "td", "Rails App"
  # end
end

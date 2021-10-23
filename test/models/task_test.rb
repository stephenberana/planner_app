require "test_helper"

class TaskTest < ActiveSupport::TestCase
  setup do
    @user = users(:Stephen)
    @user.password = '123456'
    # @category = user.categories.create(category_title: 'Programming', category_description: 'Tasks related to computer programming.')
  end

  test 'should not save Task without title' do
    task = @user.tasks.create(task_title: nil)

    assert_not task.save, "Task saved without title."
  end

  test 'should not save Task without description' do
    task = @user.tasks.create(description: nil)

    assert_not task.save, "Task saved without description."
  end

  test 'should not save Task without category' do
    task = @user.tasks.create(category: nil)

    assert_not task.save, "Task saved without category."
  end
  
    # test 'should save Task with title, description, and category' do
    #   task = @user.tasks.create(task_title: "Rails App", description: "In fulfillment of Avion BE course.", category: 'Programming')
  
    #   assert task.save, "Task not saved even with title and description."
    # end
  
    # test 'should not save Task if title, description, or category is missing' do
    #   task = @user.tasks.create(task_title: "Rails App", description: nil, @category(category_id: 1, category_title: 'Programming', category_description: 'Tasks related to computer programming.'))
  
    #   assert_not task.save, "Task saved with one parameter missing."
    # end
  
    # test 'should delete Task' do
    #   task = @user.tasks.create(task_title: "Rails App", description: "In fulfillment of Avion BE course.", @category(category_id: 1, category_title: 'Programming', category_description: 'Tasks related to computer programming.'))
      
    #   assert task.destroy, "Task not deleted."
    # end
end

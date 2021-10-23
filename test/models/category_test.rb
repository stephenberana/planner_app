require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  setup do
    @user = users(:Stephen)
    @user.password = '123456'
  end

  test 'should not save Category without title' do
    category = @user.categories.create(category_title: nil)

    assert_not category.save, "Category saved without title."
  end

  test 'should not save Category without description' do
    category = @user.categories.create(category_description: nil)

    assert_not category.save, "Category saved without description."
  end

  test 'should save Category with title and description' do
    category = @user.categories.create(category_title: "Programming", category_description: "Tasks related to computer programming.")

    assert category.save, "Category not saved even with title and description."
  end

  test 'should not save Category if title or description is missing' do
    category = @user.categories.create(category_title: "Programming", category_description: nil)

    assert_not category.save, "Category saved with one parameter missing."
  end

  test 'should delete Category' do
    category = @user.categories.create(category_title: "Programming", category_description: "Tasks related to computer programming.")
    
    assert category.destroy, "Category not deleted."
  end

  # test 'should be able to edit Category' do
  #   category = @user.categories.create(id: 1, category_title: "Programming", category_description: "Tasks related to computer programming.")

  #   assert category.update, "Category cannot be edited."
  # end
end

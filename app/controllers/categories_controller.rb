class CategoriesController < ApplicationController

#initiate new category
def new
    @category = Category.new
end

#show category
def show
end

#create new category
def create
    @category = Category.new(cat_params)

    if category.save
        redirect_to @category, notice: "Category successfully created."
    else
        render :new
    end
end

#update category
def update
    if @category.update(cat_params)
        redirect_to @category, notice: 'Category successfully updated.'
    else
        render :edit
    end
end

#delete category
def destroy
    @category.destroy
    redirect_to root_path, notice: 'Category was successfully deleted.'
end

private
    def set_category
        @category = Category.find(params[:id])
    end

    def category_params
        params.require(:category).permit(:category_title, :category_description)
    end
end

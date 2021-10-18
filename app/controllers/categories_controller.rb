class CategoriesController < ApplicationController
    before_action :set_category, only: [:edit, :update, :destroy]

#initiate new category
def new
    @category = Category.new
end

#index all categories
def index
    @categories = Category.all
end

#show category
def show
    redirect_to action: "index"
end

#create new category
def create
    @category = Category.new(category_params)

    if @category.save
        redirect_to @category, notice: "Category successfully created."
    else
        render :new
    end
end

#find editable category
def edit
    @category = Category.find(params[:id])
end

#update category
def update
    if @category.update(category_params)
        redirect_to @category, notice: 'Category successfully updated.'
    else
        render :edit
    end
end

#delete category
def destroy
    @category.destroy
    redirect_to action: "index", notice: 'Category was successfully deleted.'
end

private
    def set_category
        @category = Category.find(params[:id])
    end

    def category_params
        params.require(:category).permit(:category_title, :category_description)
    end
end

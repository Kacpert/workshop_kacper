class ProductsController < ApplicationController
  before_action :logged_user, only: [:update, :destroy, :create]
  before_action :correct_user, only: [:edit, :update, :destroy]
  expose(:category)
  expose(:products) { category.products}
  expose(:product)
  expose(:review) { Review.new }
  expose_decorated(:reviews, ancestor: :product)

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    self.product = Product.new(product_params)
    product.user = current_user 

    if product.save
      category.products << product
      redirect_to category_product_url(category, product), notice: 'Product was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if self.product.update(product_params)
      redirect_to category_products_path, notice: 'Product was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /products/1
  def destroy
    product.destroy
    redirect_to :back, notice: 'Product was successfully destroyed.'
  end

  private

  def logged_user
    unless authenticate_user!
      redirect_to new_user_session_path
    end
  end

  def correct_user
    unless current_user == product.user
      flash[:error] = 'You are not allowed to edit this product.'
      redirect_to(category_product_url(category, product))
    end    
  end

  def product_params
    params.require(:product).permit(:title, :description, :price, :category_id)
  end
end

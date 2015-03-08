class ReviewsController < ApplicationController

  expose(:review)
  expose(:product)

  def edit
  end

  def create
    self.review = Review.new(review_params)
    #current_user.reviews << review
    review.user = current_user 


    if review.save
      product.reviews << review
      redirect_to category_product_url(product.category, product), notice: 'Review was successfully created.'
    else
      redirect_to :back, notice: 'You must fill in both fields'
    end
  end

  def destroy
    review.destroy
    redirect_to category_product_url(product.category, product), notice: 'Review was successfully destroyed.'
  end

  private
    def review_params
      params.require(:review).permit(:content, :rating)
    end
end

class ReviewsController < ApplicationController

  def create
    @product = Product.find(params[:product_id])
    @review = Review.new(review_params)
    @review.product = @product
    if @review.save
      flash[:notice] = 'Review successfully added'
      redirect_to product_path(@product)
    else
      flash[:error] = @review.errors.full_messages.join(' ')
      redirect_to product_path(@product)
    end
  end

  protected
  def review_params
    params.require(:review).permit(:title, :body, :product, :user_id, :product_id)
  end
end

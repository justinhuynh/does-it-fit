class ReviewsController < ApplicationController
  def create
    @user = current_user
    @product = Product.find(params[:product_id])
    @review = Review.new(review_params)
    @review.product = @product
    @review.user = @user

    if @review.save
      flash[:notice] = 'Review successfully added'
      redirect_to product_path(@product)
    elsif
      @review.errors.full_messages.join(' ').include?('User')
      flash[:error] = 'You must be signed in'
      redirect_to product_path(@product)
    else
      flash[:error] = @review.errors.full_messages.join(' ')
      redirect_to product_path(@product)
    end
  end

  protected

  def review_params
    params.require(:review).permit(:title, :body, :product, :product_fit, :user_id, :product_id)
  end
end

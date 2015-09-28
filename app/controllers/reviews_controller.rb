class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def create
    @user = current_user
    @product = Product.find(params[:product_id])
    @review = Review.new(review_params)
    @review.product = @product
    @review.user = @user

    if @review.save
      flash[:notice] = 'Review successfully added'
      redirect_to product_path(@product)
    else
      flash[:error] = @review.errors.full_messages.join(' ')
      redirect_to product_path(@product)
    end
  end

  def edit
    @review = Review.find(params[:id])
    @product = Product.find(params[:product_id])
  end

  def update
    @review = Review.find(params[:id])
    @product = @review.product
    if @review.update(review_params)
      flash[:success] = 'review updated successfully!'
      redirect_to @product
    else
      flash[:warning] = @review.errors.full_messages.join(', ')
      render :edit
    end
  end

  protected
  def review_params
    params.require(:review).permit(:title, :body, :product_fit)
  end
end

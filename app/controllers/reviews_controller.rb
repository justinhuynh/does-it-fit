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

  def edit
    @review = Review.find(id = params[:id])
    @product = Product.find(params[:product_id])
    redirect_to edit_product_review_path
  end

  def update
    @review = Review.find(id = params[:id])
    @product = @review.product
    @product.reviews.each do |review |
      review.update(body: "new text")
    end
      @review.update(body: "new text")
      redirect_to @product
    end

  protected

  def review_params
    params.require(:review).permit(:title, :body, :product, :product_fit,
                    :user_id, :product_id)
  end
end

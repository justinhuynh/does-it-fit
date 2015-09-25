class VotesController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = current_user
    @review = Review.find(vote_params[:review_id])
    @product = @review.product
    @vote = Vote.new(vote_params)
    @vote.user = @user

    if @vote.save
      flash[:notice] = 'Thanks for your vote'
      redirect_to product_path(@product)
    else
      flash[:error] = @vote.errors.full_messages.join(' ')
      redirect_to product_path(@product)
    end
  end

  def update
    @vote = Vote.find(params[:vote_id])
  end

  protected
  
  def vote_params
    params.require(:vote).permit(:helpful, :review_id)
  end
end

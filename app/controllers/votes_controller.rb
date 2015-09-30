class VotesController < ApplicationController
  before_action :authenticate_user!

  def create
    @review = Review.find(params[:review_id])
    @vote = @review.votes.find_or_create_by(user: current_user)
    @vote.update(vote_params)
    @product = @review.product
    render json: { up: @review.thumbs_up, down: @review.thumbs_down }
  end

  protected

  def vote_params
    params.require(:vote).permit(:helpful)
  end
end

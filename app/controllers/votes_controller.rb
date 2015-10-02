class VotesController < ApplicationController
  before_action :authenticate_user!
  before_action :require_permission, only: [:destroy]

  def create
    @review = Review.find(params[:review_id])
    @vote = @review.votes.find_or_create_by(user: current_user)
    @vote.update(vote_params)
    render json: {
      up: @review.thumbs_up,
      down: @review.thumbs_down,
      voteId: @vote.id
    }
  end

  def destroy
    @vote = Vote.find(params[:id])
    @review = @vote.review
    @vote.destroy
    render json: {
      up: @review.thumbs_up,
      down: @review.thumbs_down
    }
  end

  protected

  def vote_params
    params.require(:vote).permit(:helpful)
  end

  def require_permission
    @vote = Vote.find(params[:id])
    @product = @vote.review.product
    if (current_user != @vote.user) && !current_user.admin?
      flash[:error] = "You can't delete someone else\'s vote!"
      redirect_to @product
    end
  end
end

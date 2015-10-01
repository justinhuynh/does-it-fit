class HomesController < ApplicationController
  def index
    @hi = Review.last.product
  end
end

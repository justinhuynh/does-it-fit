class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  has_many :votes
  after_commit :update_product_average_fit

  validates :title, presence: true
  validates :body, presence: true
  validates :product_fit, presence: true
  validates :product_fit, numericality: { only_integer: true }
  validates :product_fit, inclusion: { in: 0..10 }
  validates :user_id, presence: true
  validates :product_id, presence: true

  def thumbs_up
    votes.where(helpful: true).length
  end

  def thumbs_down
    votes.where(helpful: false).length
  end

  def update_product_average_fit
    product.update_average_fit
  end
end

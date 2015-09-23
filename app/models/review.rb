class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :product

  validates :title, presence: true
  validates :body, presence: true
  validates :product_fit, presence: true
  validates :user_id, presence: true
  validates :product_id, presence: true
end

class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :product

  validates :title, presence: true
  validates :body, presence: true
  validates :product_fit, presence: true
  validates :product_fit, numericality: { only_integer: true }
  validates :product_fit, inclusion: { in: 1..10 }
  validates :user_id, presence: true
  validates :product_id, presence: true
end

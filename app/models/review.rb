class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  has_many :votes

  validates :title, presence: true
  validates :body, presence: true
  validates :product_fit, presence: true
  validates :product_fit, numericality: { only_integer: true }
  validates :product_fit, inclusion: { in: 1..10 }
  validates :user_id, presence: true
  validates :product_id, presence: true

  def thumbs_up
    votes.where(helpful: true).length
  end

  def thumbs_down
    votes.where(helpful: false).length
  end
end


def square_of_2?(num)
  i = 0
  until 2^i > num
    (1..i).each do | thing |
      

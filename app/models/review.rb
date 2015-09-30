class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :product

  validates :title, presence: true
  validates :body, presence: true
  validates :product_fit, presence: true
  validates :user_id, presence: true
  validates :product_id, presence: true
end


def square_of_2?(num)
  i = 0
  until 2^i > num
    (1..i).each do | thing |
      

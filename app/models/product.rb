class Product < ActiveRecord::Base
  belongs_to :brand
  belongs_to :category
  validates :title, presence: true
  validates :brand_id, presence: true
  validates :brand_id, numericality: { integer_only: true }
  validates :category_id, presence: true
  validates :category_id, numericality: { integer_only: true }
  validates :average_fit, presence: true
end

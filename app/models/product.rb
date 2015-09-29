class Product < ActiveRecord::Base
  has_many :reviews
  belongs_to :brand
  belongs_to :category
  validates :title, presence: true
  validates :brand_id, presence: true
  validates :brand_id, numericality: { only_integer: true }
  validates :category_id, presence: true
  validates :category_id, numericality: { only_integer: true }
  validates :average_fit, presence: true

  def self.search(search)
    where('title ILIKE ?', "%#{search}%")
  end
end

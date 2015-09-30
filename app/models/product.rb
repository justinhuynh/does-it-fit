class Product < ActiveRecord::Base
  has_many :reviews
  belongs_to :user
  belongs_to :brand
  belongs_to :category
  validates :title, presence: true
  validates :brand, presence: true
  validates :brand_id, numericality: { only_integer: true }
  validates :category, presence: true
  validates :category_id, numericality: { only_integer: true }
  validates :user, presence: true
  validates :user_id, numericality: { only_integer: true }
  validates :average_fit, presence: true

  FIT_SCALE = [ "too small", "true to size", "runs large" ]

  def self.search(search)
    where('title ILIKE ?', "%#{search}%")
  end

  def update_average_fit
    return 5 if reviews.empty?
    arr = reviews.map { |review| review.product_fit }
    average = arr.inject(0) { |total, item| total + item } / arr.size
    update_attributes(average_fit: average)
  end

  def average_fit_text
    case average_fit
      when 0..3 then FIT_SCALE[0]
      when 4..7 then FIT_SCALE[1]
      when 8..10 then FIT_SCALE[2]
    end
  end
end

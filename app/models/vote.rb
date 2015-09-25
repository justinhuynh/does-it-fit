class Vote < ActiveRecord::Base
  validates :review, presence: true
  belongs_to :review
  belongs_to :user

  validates :user, uniqueness: {
    scope: :review,
    message: "only one vote per user"
  }
end

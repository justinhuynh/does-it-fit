class Vote < ActiveRecord::Base
  belongs_to :review
  belongs_to :user

  validates :review, presence: true
  validates :user, presence: true

  validates :user, uniqueness: {
    scope: :review,
    message: "only one vote per user per review"
  }

  validates :review, uniqueness: {
    scope: :user,
    message: "only one user per vote per review"
  }

end

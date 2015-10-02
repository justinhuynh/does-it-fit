class Vote < ActiveRecord::Base
  validates :review, presence: true
  validates :user, presence: true
  belongs_to :review
  belongs_to :user

  validates :user, uniqueness: {
    scope: :review,
    message: "only one vote per user"
  }

  def message
    string = helpful ? "helpful" : "not helpful"
    "You voted this review as #{string}."
  end
end

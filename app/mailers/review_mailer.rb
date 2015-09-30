class ReviewMailer < ApplicationMailer
  def new_review(review)
    @review = review

    mail(
    to: review.product.user.email,
    subject: "There's a new review for your product, #{review.product.title}."
    )
  end
end

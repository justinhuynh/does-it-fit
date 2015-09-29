$(".vote").on("click", function(event) {
  event.preventDefault();
  var $this = $(this);
  var reviewId = $this.data("reviewId");
  var helpful = $this.data("helpful");
  var request = $.ajax({
    method: "POST",
    url: ('/reviews/' + reviewId + '/votes'),
    data: { vote: { helpful: helpful}, review_id: reviewId  },
    dataType: "json"
  });
  request.success(function(data) {
    var review = $("#review"+reviewId);
    var upcount = review.find(".up-count");
    var downcount = review.find(".down-count");
    var message = review.find(".ajax-message");
    upcount.text(data["up"]);
    downcount.text(data["down"]);
    message.text("Thanks for your vote");
  });
  request.error(function() {
    var review = $("#review"+reviewId);
    var message = review.find(".ajax-message");
    message.text("You must sign in to vote");
  });
});

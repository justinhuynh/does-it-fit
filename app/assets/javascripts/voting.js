$(".vote").on("click", function(event) {
  event.preventDefault();
  var $this = $(this);
  var reviewId = $this.data("reviewId");
  var helpful = $this.data("helpful");
  var request = $.ajax({
    method: "POST",
    url: ("/reviews/" + reviewId + "/votes"),
    data: { vote: { helpful: helpful }, review_id: reviewId  },
    dataType: "json"
  });
  request.success(function(data) {
    var review = $("#review"+reviewId);
    var upcount = review.find(".up-count");
    var downcount = review.find(".down-count");
    var message = review.find(".ajax-message");
    var initialMessage = review.find(".initial-message");
    upcount.text(data.up);
    downcount.text(data.down);
    initialMessage.hide();
    message.text("Thanks for your vote ");
    message.append(showDelete(data.voteId, reviewId));
  });
  request.error(function() {
    var review = $("#review"+reviewId);
    var message = review.find(".ajax-message");
    message.text("You must sign in to vote");
  });
});

$(".initial-message").on("click", ".delete-vote", function(event) {
  event.preventDefault();
  var $this = $(this);
  var reviewId = $this.data("reviewId");
  var voteId = $this.data("voteId");
  var request = $.ajax({
    type: "DELETE",
    url: ("/reviews/" + reviewId + "/votes/" + voteId),
    data: { id: voteId },
    dataType: "json"
  });

  request.success(function(data) {
    var review = $("#review"+reviewId);
    var upcount = review.find(".up-count");
    var downcount = review.find(".down-count");
    var message = review.find(".ajax-message");
    var initialMessage = review.find(".initial-message");
    initialMessage.hide();
    upcount.text(data.up);
    downcount.text(data.down);
    message.text("Your vote has been deleted");
  });
});

$(".ajax-message").on("click", "a.delete-vote", function(event) {
  event.preventDefault();
  var $this = $(this);
  var reviewId = $this.data("reviewId");
  var voteId = $this.data("voteId");
  var request = $.ajax({
    type: "DELETE",
    url: ("/reviews/" + reviewId + "/votes/" + voteId),
    data: { id: voteId },
    dataType: "json"
  });

  request.success(function(data) {
    var review = $("#review"+reviewId);
    var upcount = review.find(".up-count");
    var downcount = review.find(".down-count");
    var message = review.find(".ajax-message");
    var initialMessage = review.find(".initial-message");
    initialMessage.hide();
    upcount.text(data.up);
    downcount.text(data.down);
    message.text("Your vote has been deleted");
  });
});

var showDelete = function(newVoteId, newReviewId) {
  var $deleteLink = $("<a />", {
    class : "delete-vote",
    href : "#",
    text : "Delete Vote",
    data : { voteId: newVoteId, reviewId: newReviewId }
  });
  return $deleteLink;
}

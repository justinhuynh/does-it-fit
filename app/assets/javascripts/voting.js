$(".up").on("click", function(event) {
  event.preventDefault();
  var $this = $(this);
  var reviewId = $this.data('reviewId');
  //var helpful = $this.data('helpful')
  var request = $.ajax({
    method: "POST",
    url: ('/reviews/' + reviewId + '/votes'),
    data: { vote: { helpful: true}, review_id: reviewId  },
    dataType: "json"
  });
  request.success(function(data) {
    $review=$('#'+reviewId);
    $upcount = $review.find('.up-count')
    $downcount = $review.find('.down-count')
    $upcount.text(data['up'])
    $downcount.text(data['down'])
  });
  request.error(function() {
    alert("Error");
  });
});

$(".down").on("click", function(event) {
  event.preventDefault();
  var $this = $(this);
  var reviewId = $this.data('reviewId');
  //var helpful = $this.data('helpful')
  var request = $.ajax({
    method: "POST",
    url: ('/reviews/' + reviewId + '/votes'),
    data: { vote: { helpful: false}, review_id: reviewId  },
    dataType: "json"
  });
  request.success(function(data) {
    $review=$('#'+reviewId);
    $upcount = $review.find('.up-count')
    $downcount = $review.find('.down-count')
    $upcount.text(data['up'])
    $downcount.text(data['down'])
  });
  request.error(function() {
    alert("Error");
  });
});

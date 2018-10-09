class Review {

	constructor(review){

		debugger
		this.id = review["id"];
		//array of review objects- need to cycle through review objects, pull out comments and rating, and associate with user
		this.reviews = review["attributes"]["reviews"]; //["0"]["comments"]
		
		// array of users, need to associate with correct review.
		this.users = review["attributes"]["users"];
	}
}

$(function () {
  $(".js-debug").on('click', function() {
    var id = $(this).data("id");
    $.get("/books/" + id + '.json', function(data) {
      // load reviews
      var review = new Review(data.data);
      //debugger
      // book methods data.attributes.reviews - loop over reviews, format to html
      //book.showReviews();
      $("#reviews-" + id).text(data);
    });
  });
});

// setting up a method to show all book reviews when button is clicked.
class Book {
	constructor(book) {

		//debugger
		this.id = book["id"];
		this.title = book["attributes"]["title"];
		this.author = book["attributes"]["author"];
		this.month_assigned = book["attributes"]["month-assigned"];
		this.year_assigned = book["attributes"]["year-assigned"];
		this.genre = book["attributes"]["genre"];
		this.pages = book["attributes"]["pages"];

		this.reviews = book["attributes"]["reviews"]

		//debugger
	}

	showReviews() {
		//loop over this.reviews
		let comments = [];
		this.reviews.forEach (review => {
			comments.push(`${review.comments} - Rating: ${review.rating}`)
		})
		debugger
		return comments
	}
}


$(function () {
  $(".js-reviews").on('click', function() {
    var id = $(this).data("id");
    $.get("/books/" + id + '.json', function(data) {
      // load reviews
      var book = new Book(data.data);
      //debugger
      // book methods data.attributes.reviews - loop over reviews, format to html
      book.showReviews();

      $("#reviews-" + id).text(data);
    });
  });
});
// setting up a method to show all book reviews when button is clicked.
class Book {
	constructor(book) {
		this.id = book["id"];
		this.title = book["attributes"]["title"];
		this.author = book["attributes"]["author"];
		this.month_assigned = book["attributes"]["month-assigned"];
		this.year_assigned = book["attributes"]["year-assigned"];
		this.genre = book["attributes"]["genre"];
		this.pages = book["attributes"]["pages"];

		this.reviews = book["attributes"]["reviews"]
	}

	showReviews() {
		//loop over this.reviews
		let str = '<ul>';
		this.reviews.forEach (review => {
			str += ('<li>' + `${review.comments} - Rating: ${review.rating}` + '</li>');
		})
		str += '</ul>'
		return str
	}
}

$( document ).ready(function() {
});

$(function () {
  $(".js-reviews").on('click', function() {
    var id = $(this).data("id");
    $.get("/books/" + id + '.json', function(data) {
      // load reviews
      var book = new Book(data.data);
      //debugger
      //book methods data.attributes.reviews - loop over reviews, format to html

      const reviewList = book.showReviews(); 
      //debugger
      result = document.getElementById("showReviews");
      result.innerHTML = reviewList;
      
    });
  });
});

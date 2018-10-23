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

	moreInfo() {
		let str = ''
		// blank str to reset on method call
		str += `<h3>Genre: ${this.genre}</h3>
		<h3>Number of Pages: ${this.pages}</h3><br>`;
		let reviews = '<h3>Reviews: </h3>' + this.showReviews();

		return str + reviews;
	}
}

Book.prototype.showReviews = function () {
	let str = '<ul>';
		this.reviews.forEach (review => {
			str += ('<li>' + `${review.comments} - Rating: ${review.rating}` + '</li>');
		});
		str += '</ul>';
		return str;
}

$( document ).ready(function() {
 
	
		$('#new_review').on('submit', function(event) {
			event.preventDefault();
	 
			$.ajax ({
				type: 'POST',
				url: this.action,
				data: $(this).serialize(),
				success: function(res) {
					debugger
					$("#review_comments").val("");
					$("#review_rating").val("")
					var $ul = $('div.reviews ul');
					$ul.append(res);
					
				}
			});

			
		})
	
// index page - show more info and reviews for book on button push
	$(".js-more").on('click', function() {

    var id = $(this).data("id");
    $.get("/books/" + id + '.json', function(data) {
      var book = new Book(data.data);
      const moreInfo = book.moreInfo(); 
      showMore = document.getElementById(`more-${book.id}`);

      showMore.innerHTML = moreInfo;
    });
  }); 
})



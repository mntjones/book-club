// setting up a method to show all book reviews when button is clicked.
class Book {
	// "this" is whatever book id is current
	constructor(book) {
		this.id = book["id"];
		this.title = book["attributes"]["title"];
		this.author = book["attributes"]["author"];
		this.month_assigned = book["attributes"]["month-assigned"];
		this.year_assigned = book["attributes"]["year-assigned"];
		this.genre = book["attributes"]["genre"];
		this.pages = book["attributes"]["pages"];
		this.avgRating = book["attributes"]["avg-rating"]
		this.reviews = book["attributes"]["reviews"]
	}

// method to show more info when that button is pushed on the list page
	moreInfo() {
		let str = ''
		// blank str to reset on method call
		str += `<h3>Genre: ${this.genre}</h3>
		<h3>Number of Pages: ${this.pages}</h3><br>`;
		// calls showReviews method below, lists each review
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

$( document ).on('turbolinks:load', function() {
 
	
		$('#new_review').on('submit', function(event) {
			event.preventDefault();
	 // POST new review
			$.ajax ({
				type: 'POST',
				url: this.action,
				data: $(this).serialize(),
				success: function(res) {
					$("#review_comments").val("");
					$("#review_rating").val("")
					var $ul = $('div.reviews ul');
					$ul.append(res);
					// $ul.append("<%=j (render('reviews/review', :review => @review)) %>");
				}
			});
		})

// index page - sort
	$(".book-sort").on('click', function() {

		$.get("/books.json", function(list) {
			list.data.sort(function(a,b) { 
				// sorts by avg rating
				return b.attributes["avg-rating"] - a.attributes["avg-rating"]});
			// clears #booklist in index.html.erb
			$('#bookList').empty();

			let str = "<ul>";
			list.data.forEach(function(bookData){
				let newBook = new Book(bookData)
				str += ('<li>' + 'Title: ' + newBook.title.link(`/books/${newBook.id}`) + "  -  Rating: " + newBook.avgRating + "</li>");		
			})
			str += "</ul>"
			// replace #booklist with sorted books
			$('#bookList').replaceWith(str);
		})

		

	})


// index page - show more info and reviews for book on button push
	$(".js-more").on('click', function() {

    var id = $(this).data("id");
    $.get("/books/" + id , function(data) {
      var book = new Book(data.data);
      const moreInfo = book.moreInfo(); 
      showMore = document.getElementById(`more-${book.id}`);

      showMore.innerHTML = moreInfo;
    }, "json");
  }); 
})



// setting up a method to show all book reviews when button is clicked.
class Book {
	constructor(book) {
		this.id = book["id"];
		this.title = book["title"];
		this.author = book["author"];
		this.month_assigned = book["month_assigned"];
		this.year_assigned = book["year_assigned"];
		this.genre = book["genre"];
		this.pages = book["pages"];

		if (book["reviews"]) {
			console.log("I have reviews");
		}
	}
}
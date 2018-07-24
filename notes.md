Validations?


NEED TO ADD VALIDATION - Month + year =  unique

Others?

<%= label_tag('book[title]', "Book for Review") %>
	<%= select_tag 'book[title]', options_from_collection_for_select(@books, "id", "title", session['book[title]']) %> <br>
# book-club

This Ruby on Rails web app is to keep track of a Book Club's book of the month, and post the user's comments and rating of the book. Included in this app is javascript and AJAX functionality (V2).

## Application Description

This application was created for a Book Club to keep track of the books assigned by month. Each user who is signed in can review a Book by adding a rating (1-5) and a review. A User can view their homepage, which lists the books they have reviewed and the rating and reviews given.

A User can add a book, with title, author and month and year assigned. A User can also view a single title and see the ratings and reviews for that book.

A list of books is available with the average rating for each title shown.

A User can add a new review, edit a previous review, or delete a review.


## Usage
To use this app, make sure you have rails installed (or gem install rails). 
1. Clone from github 
2. bundle install
3. rake db:migrate
4. rails s 
Head over to to the url the rails server provides and the app will be up and running.

## V1 - Rails
Uses:
- MVC models
- ActiveRecord and SQL
- OAuth authentication 
- HTML, ERB and CSS
- RESTful routing 

## V2 - Rails with Javascript/AJAX
Added:
- rendering with jQuery and Active Model Serialization
- Rails API reveals at least one has-many relationship in the JSON and renders to page
- Rails API uses a form to create a resource and render to page without a page refresh
- Translation of JSON responses to Javascript Model Objects

## Contributing
Bug reports and pull requests are welcome on GitHub at https://github.com/mntjones/book-club. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the Contributor Covenant code of conduct.

## License
The web app is available as open source under the terms of the MIT License.

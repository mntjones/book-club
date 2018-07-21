User.create(name: "Monica Tamaru", email: "monica@monica.com", password: "monica")
User.create(name: "Peter Parker", email: "spider@sense.com", password: "photos")
User.create(name: "Remy LeBeau", email: "cards@cajun.com", password: "gambit")

Book.create(title: "The Hobbit", author: "JR Tolkein", genre:"fantasy", pages: 384)
Book.create(title: "Jane Eyre", author: "Charlotte Bronte", genre:"romance", pages: 290)
Book.create(title: "Treasure Island", author: "Robert Louis Stevenson", genre:"adventure", pages: 122)

Review.create(user_id: 1, book_id: 1, comments: "I enjoyed the world that Tolkein created. The adventure was exciting and I thouroughly loved the characters.", rating: 4)
Review.create(user_id: 1, book_id: 2, comments: "This is one of my favourite books. The characters are dark but still relatable. It is a love story, but showcases the bitter parts of rejection and how easily love can mimic hated in some situations. I recommend it to everyone.", rating: 5)
Review.create(user_id: 2, book_id: 1, comments: "I did not enjoy this book. It was too silly, and the adventure was too dangerous. The dragon and the ring guy were very scary", rating: 2)
Review.create(user_id: 2, book_id: 3, comments: "This is a high flying adventure book and I felt engrossed with every turn of the page. Just a shame that it was so short!", rating: 5)
Review.create(user_id: 3, book_id: 1, comments: "The Hobbit is one of my favorite books ever! Tolkein is a genius at world building and story weaving, and this, as a prequel to Lord of the Rings, is at the top of the genre.", rating: 5)
Review.create(user_id: 3, book_id: 2, comments: "Not for me. The gothic romances just don't resonate with me and I found it very difficult to get through this book. The romance was just so tortured to really enjoy.", rating: 2)
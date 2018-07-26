# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes) 
User has_many Reviews, Book has_many Reviews

- [x] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User)
Review belongs_to User, Review belongs_to Book

- [x] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients)
User has_many Books through Reviews, Book has_many Users through Reviews

- [x] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)
User submits comments and rating

- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
Validations include rating between 1-5, email unique, attribute presence, year only begins with 19 or 20 and is 4 digits

- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
User creation with omniauth and Book average rating

- [x] Include signup (how e.g. Devise)
form submittal or Github credentials

- [x] Include login (how e.g. Devise)
form submittal or Github credentials

- [x] Include logout (how e.g. Devise)
session destroyed

- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
Github using omniauth

- [x] Include nested resource show or index (URL e.g. users/2/recipes)
Review update or Destroy uses -> users/:id/review/:id

- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients)
Review creation uses -> books/:id/review/new

- [x] Include form display of validation errors (form URL e.g. /recipes/new)
errors.full_messages are displayed


Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate

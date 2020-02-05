# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (USER has_many MEDICATIONS; e.g. User has_many Recipes) 
- [x] Include at least one belongs_to relationship (MEDICATION belongs_to USER; e.g. Post belongs_to User)
- [x] Include at least two has_many through relationships (USER has_many MEDICATIONS through CONDITIONS - MEDICATIONS has_many USERS through CONDITIONS; e.g. Recipe has_many Items through Ingredients)
- [x] Include at least one many-to-many relationship (USER has_many MEDICATIONS through CONDITIONS - MEDICATIONS has_many USERS through CONDITIONS; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (CONDITIONS.NAME e.g. ingredients.quantity)
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
- [x] Include signup
- [x] Include login
- [x] Include logout 
- [x] Include third party signup/login (how e.g. Devise/OmniAuth) - GOOGLE OMNIAUTH
- [x] Include nested resource show or index (URL e.g. users/2/recipes) - MEDICATIONS/23/CONDITIONS
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new) - MEDICATIONS/1/CONDITIONS/NEW
- [x] Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:
- [X] The application is pretty DRY
- [X] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
json = URI.parse(url).open.read
drinks = JSON.parse(json)['drinks']

drinks.each do |ingredient|
  Ingredient.create!(name: ingredient['strIngredient1'])
end

Ingredient.create!(name: 'mint')

file_mojito = URI.open('https://www.thecocktaildb.com/images/media/drink/metwgh1606770327.jpg')
mojito = Cocktail.create!(name: 'Mojito')
mojito.photo.attach(io: file_mojito, filename: 'mojito.png', content_type: 'image/jpg')

Dose.create!(description: '2-3 oz', cocktail_id: mojito.id, ingredient_id: 1)
Dose.create!(description: 'Juice of 1', cocktail_id: mojito.id, ingredient_id: 56)
Dose.create!(description: '2 teaspoon of', cocktail_id: mojito.id, ingredient_id: 25)
Dose.create!(description: '2-4 leaves of', cocktail_id: mojito.id, ingredient_id: 101)
Dose.create!(description: '30 oz', cocktail_id: mojito.id, ingredient_id: 33)

file_old_fashioned = URI.open('https://www.thecocktaildb.com/images/media/drink/vrwquq1478252802.jpg')
old_fashioned = Cocktail.create!(name: 'Old Fashioned')
old_fashioned.photo.attach(io: file_old_fashioned, filename: 'old_fashioned.jpg', content_type: 'image/jpg')

Dose.create!(description: '2 oz', cocktail_id: old_fashioned.id, ingredient_id: 20)
Dose.create!(description: '2 dashes Angostura', cocktail_id: old_fashioned.id, ingredient_id: 24)
Dose.create!(description: '1/2 teaspoon of', cocktail_id: old_fashioned.id, ingredient_id: 25)
Dose.create!(description: '1 teaspoon', cocktail_id: old_fashioned.id, ingredient_id: 33)

file_daiquiri = URI.open('https://www.thecocktaildb.com/images/media/drink/mrz9091589574515.jpg')
daiquiri = Cocktail.create!(name: 'Daiquiri')
daiquiri.photo.attach(io: file_daiquiri, filename: 'daiquiri.jpg', content_type: 'image/jpg')

Dose.create!(description: '1.5 oz', cocktail_id: daiquiri.id, ingredient_id: 1)
Dose.create!(description: 'Juice of 1/2', cocktail_id: daiquiri.id, ingredient_id: 56)
Dose.create!(description: '1 teaspoon of', cocktail_id: daiquiri.id, ingredient_id: 25)

file_balmoral = URI.open('https://www.thecocktaildb.com/images/media/drink/vysuyq1441206297.jpg')
balmoral = Cocktail.create!(name: 'Balmoral')
balmoral.photo.attach(io: file_balmoral, filename: 'balmoral.jpg', content_type: 'image/jpg')

Dose.create!(description: '1.5 oz', cocktail_id: balmoral.id, ingredient_id: 7)
Dose.create!(description: '0.5 oz', cocktail_id: balmoral.id, ingredient_id: 5)
Dose.create!(description: '0.5 oz', cocktail_id: balmoral.id, ingredient_id: 15)
Dose.create!(description: '2 dashes', cocktail_id: balmoral.id, ingredient_id: 24)
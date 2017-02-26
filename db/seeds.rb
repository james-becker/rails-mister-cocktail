require "open-uri"
require "json"
require "faker"

# populate ingredients === done

Dose.delete_all
Ingredient.delete_all
Cocktail.delete_all

info = JSON.parse(open("http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list").read)
info["drinks"].each do |ingredient|
  name_ingredient = ingredient["strIngredient1"]
  Ingredient.create(name: name_ingredient)
end

# get a random number of ingredients and assing each with a dose to a cocktail 50 times === done

50.times do |i|
  cocktail_name = Faker::Name.first_name
  cocktail_photo = "http://lorempixel.com/320/220/nightlife"
  cocktail = Cocktail.new(name: cocktail_name, remote_photo_url: cocktail_photo)
  cocktail.save
  rand_number = rand(3) + 2
  rand_number.times do |i|
    offset = rand(Ingredient.count)
    rand_record = Ingredient.offset(offset).first

    dose_description = Faker::Lorem.paragraph
    dose = Dose.new(description: dose_description)
    dose.ingredient = rand_record
    dose.cocktail = cocktail
    dose.save
  end
end

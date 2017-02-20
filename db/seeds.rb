# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all
Recipe.delete_all
Label.delete_all

User.create!(username: 'anna', email: "anna@aol.com", password: "huh")

content_for_recipes = [
	{ :title => "Salsify Taro Catsear Garlic",
    :body  => "Gumbo beet greens corn soko endive gumbo gourd. Parsley shallot courgette tatsoi pea sprouts fava bean collard greens dandelion okra wakame tomato. Dandelion cucumber earthnut pea peanut soko zucchini."},
  { :title => "Kohlrabi Radish Okra Azuki",
    :body  => "Turnip greens yarrow ricebean rutabaga endive cauliflower sea lettuce kohlrabi amaranth water spinach avocado daikon napa cabbage asparagus winter purslane kale. "},
  { :title => "Lotus Root Water Spinach",
  	:body  => "Celery potato scallion desert raisin horseradish spinach carrot soko. Lotus root water spinach fennel kombu maize bamboo shoot green bean swiss chard seakale pumpkin onion chickpea gram corn pea. "},
  { :title => "Bean Swiss Chard Seakale",
    :body  => "Nori grape silver beet broccoli kombu beet greens fava bean potato quandong celery. Bunya nuts black-eyed pea prairie turnip leek lentil turnip greens parsnip. Sea lettuce lettuce water chestnut eggplant winter purslane fennel azuki bean earthnut pea sierra leone bologi leek soko chicory celtuce parsley"},
  { :title => "Magis Kohlrabi Welsh Onion",
    :body  => "Celery quandong swiss chard chicory earthnut pea potato. Salsify taro catsear garlic gram celery bitterleaf wattle seed collard greens nori. Grape wattle seed kombu beetroot horseradish carrot squash brussels sprout chard."},
  { :title => "Parsley Shallot Courgette Tatsoi",
    :body  => "Beetroot water spinach okra water chestnut ricebean pea catsear courgette summer purslane. Water spinach arugula pea tatsoi aubergine spring onion bush tomato kale radicchio turnip chicory salsify pea sprouts fava bean. "},
  { :title => "Bean Mustard Tigernut",
    :body  => "Soko radicchio bunya nuts gram dulse silver beet parsnip napa cabbage lotus root sea lettuce brussels sprout cabbage. Catsear cauliflower garbanzo yarrow salsify chicory garlic bell pepper napa cabbage lettuce tomato kale arugula melon sierra leone bologi rutabaga tigernut."},
  { :title => "Aubergine Spring Onion",
    :body  => "Sea lettuce gumbo grape kale kombu cauliflower salsify kohlrabi okra sea lettuce broccoli celery lotus root carrot winter purslane turnip greens garlic. JÃ­cama garlic courgette coriander radicchio plantain scallion cauliflower fava bean desert raisin spring onion chicory bunya nuts."},
  { :title => "Chicory Celtuce Parsley",
    :body  => "Soko radicchio bunya nuts gram dulse silver beet parsnip napa cabbage lotus root sea lettuce brussels sprout cabbage. Catsear cauliflower garbanzo yarrow salsify chicory garlic bell pepper napa cabbage lettuce tomato kale arugula melon sierra leone bologi rutabaga tigernut. "},
  { :title => "Coriander Yarrow Sweet Pepper",
    :body  => "Water spinach arugula pea tatsoi aubergine spring onion bush tomato kale radicchio turnip chicory salsify pea sprouts fava bean. Dandelion zucchini burdock yarrow chickpea dandelion sorrel courgette turnip greens tigernut soybean radish artichoke wattle seed endive groundnut broccoli arugula."}
]

content_for_labels = [
	{ description: "Vegetarian" },
	{ description: "Beef" },
	{ description: "Chicken" },
	{ description: "Favorite" }
]

recipes = Recipe.create!(content_for_recipes)
labels = Label.create!(content_for_labels)


recipes.each do |recipe|
  recipe_labels = labels.sample(rand(2..4))
  recipe_labels.each do |label|
    Labeling.create!(label: label,
    									recipe: recipe)
  end
end

# Recipe.all.each do |recipe|
#   recipe.labels = Label.find(rand(Label.count) + 1 )
#   recipe.save
# end
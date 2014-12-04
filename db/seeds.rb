rachel  = User.create(full_name: "Rachel Warbelow", email: "demo+rachel@jumpstartlab.com", password: "password", password_confirmation: "password",)
jeff    = User.create(full_name: "Jeff", email: "demo+jeff@jumpstartlab.com", password: "password", password_confirmation: "password", full_name: "j3")
jorge   = User.create(full_name: "Jorge Tellez", email: "demo+jorge@jumpstartlab.com", password: "password", password_confirmation: "password", full_name: "novohispano")
josh    = User.create(full_name: "Josh Cheek", email: "demo+josh@jumpstartlab.com", password: "password", password_confirmation: "password", full_name: "josh", admin: true)

appetizers      = Category.create(title: "Appetizers")
sushi           = Category.create(title: "Sushi")
rolls           = Category.create(title: "Rolls")
specialty_rolls = Category.create(title: "Specialty Rolls")
vegetarian      = Category.create(title: "Vegetarian")
dairy_free      = Category.create(title: "Dairy Free")
tempura         = Category.create(title: "Tempura")
drinks          = Category.create(title: "Drinks")

tuna_poke       = appetizers.menu_items.create!(title: "Tuna Poke", description: "tuna cubes, avocado, seaweed, togarashi", price: 995)
miso_soup       = appetizers.menu_items.create!(title: "Miso Soup", description: "dashi, bonito, tofu", price: 5467)
fried_octopus   = appetizers.menu_items.create!(title: "Fried Octopus", description: "baby octopus, sesame, ginger, soy sauce, light fried", price: 4995)
edamame         = appetizers.menu_items.create!(title: "Edamame", description: "soy beans, soy sauce, togarashi", price: 1995)
tempura_veggies = appetizers.menu_items.create!(title: "Tempura Veggies", description: "cauliflowers, carrots, sweet potato, broccoli", price: 5995)
seaweed_salad   = appetizers.menu_items.create!(title: "Seaweed Salad", description: "seaweed, soy sauce, scallions, ginger, cilantro, pepper flakes", price: 3241)

tuna       = sushi.menu_items.create!(title: "Tuna", description: "blank description", price: 1247)
spicy_tuna = sushi.menu_items.create!(title: "Spicy Tuna", description: "blank description", price: 2903)
fatty_tuna = sushi.menu_items.create!(title: "Fatty Tuna", description: "blank description", price: 3981)
salmon     = sushi.menu_items.create!(title: "Salmon", description: "blank description", price: 7507)
yellowtail = sushi.menu_items.create!(title: "Yellowtail", description: "blank description", price: 5917)
mackerel   = sushi.menu_items.create!(title: "Mackerel", description: "blank description", price: 391)
eel        = sushi.menu_items.create!(title: "Eel", description: "blank description", price: 1689)

california_roll         = rolls.menu_items.create!(title: "California roll", description: "crab meat, cucumber, avocado", price: 917)
spider_roll             = rolls.menu_items.create!(title: "Spider roll", description: "soft shell crab, daikon, cucumber, avocado, spicy mayonnaise", price: 7112)
philadelphia_roll       = rolls.menu_items.create!(title: "Philadelphia roll", description: "salmon, cream cheese, cucumber", price: 6556)
spicy_tuna_roll         = rolls.menu_items.create!(title: "Spicy tuna roll", description: "spicy tuna, sriracha mayonnaise, avocado", price: 1246)
shrimp_tempura_roll     = rolls.menu_items.create!(title: "Shrimp tempura roll", description: "shrimp tempura, cucumber, ginger, yuzu", price: 4615)
lobster_tempura_roll    = rolls.menu_items.create!(title: "Lobster tempura roll", description: "lobster tempura, crab, sriracha mayo, avocado", price: 379)
vegetable_tempura_roll  = rolls.menu_items.create!(title: "Vegetable tempura roll", description: "califlower, sweet potato, zucchini, cucumber, yuzu", price: 3278)

dragon_roll             = specialty_rolls.menu_items.create!(title: "Dragon roll", description: "eel, crab, avocado, topped with tuna and salmon, eel sauce", price: 3530)
volcano_roll            = specialty_rolls.menu_items.create!(title: "Volcano roll", description: "spicy tuna, crab, salmon, ginger, spicy mayo, topped with crunch flakes.", price: 7133)
orgasm_roll             = specialty_rolls.menu_items.create!(title: "Orgasm roll", description: "tuna, crab, yellowtail, avocado, cream cheese, spicy mayo, entire roll is deep fried", price: 1292)
big_bang_roll           = specialty_rolls.menu_items.create!(title: "Big bang roll", description: "tuna, white tuna, shrimp, yellowtail, salmon, crab, avocado, jalapeno, topped with fresh water eel", price: 4712)
rainbow_roll            = specialty_rolls.menu_items.create!(title: "Rainbow roll", description: "crab, seabass, cucumber, and avocado topped with salmon and tuna", price: 3479)
spicy_cream_cheese_roll = specialty_rolls.menu_items.create!(title: "Spicy tofu cream cheese roll", description: "tofu tempura, cream cheese, avocado, crunch, spicy mayo", price: 4308)
surf_and_turf_roll      = specialty_rolls.menu_items.create!(title: "Surf and turf roll", description: "lobster, crab, avocado, spicy mayo, topped with seared kobe beef", price: 6426)

vegetarian.menu_items << seaweed_salad
vegetarian.menu_items << vegetable_tempura_roll
vegetarian.menu_items << spicy_cream_cheese_roll

dairy_free.menu_items << miso_soup
dairy_free.menu_items << edamame
dairy_free.menu_items << seaweed_salad

tempura.menu_items << shrimp_tempura_roll
tempura.menu_items << lobster_tempura_roll
tempura.menu_items << vegetable_tempura_roll

asahi         = drinks.menu_items.create!(title: "Asahi beer", description: "blank description", price: 5516)
sapporo_beer  = drinks.menu_items.create!(title: "Sapporo beer", description: "blank description", price: 5629)
kirin         = drinks.menu_items.create!(title: "Kirin beer", description: "blank description", price: 5378)
chang         = drinks.menu_items.create!(title: "Chang beer", description: "blank description", price: 5530)
momokawa      = drinks.menu_items.create!(title: "Momokawa sake", description: "blank description", price: 6204)
junmai        = drinks.menu_items.create!(title: "Junmai sake", description: "blank description", price: 1517)
daiginjo      = drinks.menu_items.create!(title: "Daiginjo sake", description: "blank description", price: 6018)
ginjo         = drinks.menu_items.create!(title: "Ginjo sake", description: "blank description", price: 7950)
plum_wine     = drinks.menu_items.create!(title: "Plum wine", description: "blank description", price: 1757)
tea           = drinks.menu_items.create!(title: "Tea", description: "blank description", price: 2717)

jorge.orders.create do |order|
  order.order_menu_items.build(menu_item: tea)
  order.order_menu_items.build(menu_item: plum_wine, quantity: 3)
  order.order_menu_items.build(menu_item: miso_soup, quantity: 3)
end

josh.orders.create do |order|
  order.order_menu_items.build(menu_item: sapporo_beer, quantity: 6)
  order.order_menu_items.build(menu_item: tuna_poke, quantity: 7)
  order.order_menu_items.build(menu_item: miso_soup, quantity: 5)
end

jeff.orders.create(status: "cancelled") do |order|
  order.order_menu_items.build(menu_item: miso_soup, quantity: 5)
  order.order_menu_items.build(menu_item: vegetable_tempura_roll , quantity: 1)
  order.order_menu_items.build(menu_item: tuna, quantity: 10)
  order.order_menu_items.build(menu_item: spider_roll, quantity: 15)
  order.order_menu_items.build(menu_item: california_roll, quantity: 13)
  order.order_menu_items.build(menu_item: big_bang_roll, quantity: 42)
  order.order_menu_items.build(menu_item: momokawa, quantity: 60)
end

jeff.orders.create(status: "cancelled") do |order|
  order.order_menu_items.build(menu_item: chang, quantity: 2)
  order.order_menu_items.build(menu_item: lobster_tempura_roll , quantity: 10)
  order.order_menu_items.build(menu_item: edamame, quantity: 3)
end

rachel.orders.create(status: "cancelled") do |order|
  order.order_menu_items.build(menu_item: tea, quantity: 2)
  order.order_menu_items.build(menu_item: miso_soup, quantity: 1)
  order.order_menu_items.build(menu_item: edamame, quantity: 3)
  order.order_menu_items.build(menu_item: eel, quantity: 2)
end

rachel.orders.create do |order|
  order.order_menu_items.build(menu_item: eel, quantity: 1)
  order.order_menu_items.build(menu_item: fatty_tuna, quantity: 1)
  order.order_menu_items.build(menu_item: mackerel, quantity: 1)
  order.order_menu_items.build(menu_item: yellowtail, quantity: 1)
  order.order_menu_items.build(menu_item: yellowtail, quantity: 1)
  order.order_menu_items.build(menu_item: salmon, quantity: 1)
end

jorge.orders.create do |order|
  order.order_menu_items.build(menu_item: tuna_poke, quantity: 3)
  order.order_menu_items.build(menu_item: fried_octopus, quantity: 4)
  order.order_menu_items.build(menu_item: tempura_veggies, quantity: 1)
  order.order_menu_items.build(menu_item: seaweed_salad, quantity: 2)
end

josh.orders.create(status: "completed") do |order|
  order.order_menu_items.build(menu_item: chang, quantity: 68)
end

josh.orders.create(status: "completed") do |order|
  order.order_menu_items.build(menu_item: tea, quantity: 74)
end

jorge.orders.create(status: "completed") do |order|
  order.order_menu_items.build(menu_item: big_bang_roll, quantity: 1000)
end
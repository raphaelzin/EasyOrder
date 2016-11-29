# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.destroy_all
Waiter.destroy_all
Category.destroy_all
Dish.destroy_all
Client.destroy_all
Table.destroy_all

admin = Admin.create :name => "Master", :password => "bolaazul"
menu = Menu.create :language => "English"

waiter = Waiter.create :name => "Floyd Glass", :password => "123", :cpf => "73726742000172", :phone => "(71) 8202-7484"
waiter = Waiter.create :name => "Humphrey Parris", :password => "123", :cpf => "52468603000116", :phone => "(85) 9753-6983"
waiter = Waiter.create :name => "Caetlin Howe", :password => "123", :cpf => "90615483000121", :phone => "(67) 5413-7182"
waiter = Waiter.create :name => "Aline Forest", :password => "123", :cpf => "29147203000197", :phone => "(61) 9287-8704"
waiter = Waiter.create :name => "Stafford Gardener", :password => "123", :cpf => "22349567000100", :phone => "(11) 2020-3639"
waiter = Waiter.create :name => "Raphael Souza", :password => "ana", :cpf => "30853166000111", :phone => "(11) 5964-6454"

table = Table.create :code => "asgrg", :number => 1, :waiter_id => 1, :id => 2
table = Table.create :code => "one", :number => 2, :waiter_id => 2, :id => 3
table = Table.create :code => "sadgasdg", :number => 3, :waiter_id => 3, :id => 4
table = Table.create :code => "asdga", :number => 4, :waiter_id => 4, :id => 5
table = Table.create :code => "sadfasd", :number => 5, :waiter_id => 5, :id => 6
table = Table.create :code => "asgasdg", :number => 6, :waiter_id => 6, :id => 7
table = Table.create :code => "asdgaasd", :number => 7, :waiter_id => 1, :id => 8

category = Category.create :name => "Pizzas", :id => 1, :menu_id => 1

dish = Dish.create :title => "Double Cheese Pizza", :price => 19.90, :category_id => 1, :description => "This is a very popular veg. pizza which has a double thick layer of cheese. The double cheese pizza is very popular because of the lovers of cheese in this world are many. It is indeed one of the best and tasty pizzas among the vegetarian flavours. These are plain pizzas loaded with oodles of extra cheese which makes it delicious and most lip smacking."
dish = Dish.create :title => "Gourmet", :price => 19.90, :category_id => 1, :description => "This is a unique flavour of vegetarian pizza where the pizza where the spicy vegetarian delight is topped with extremely appealing golden corns, loaded with extra cheese. This pizza is a unique flavour because of the additional toppings like the spread of black olives and the jalapenos. This is an amazing vegetarian recipe which is a delight to have. The Gourmet pizza is a popular flavour and is indeed one of the best."
dish = Dish.create :title => "Mexican Green Wave", :price => 18.90, :category_id => 1, :description => "This is another unique recipe of American pizza which mane is influenced by the Mexican Waves. Mexican Green Wave Pizza is loaded with crunchy onions, crispy capsicum, juicy tomato and jalapeno. This is a spicy flavour which is topped my liberal sprinkling of the exotic Mexican herbs. This is a very popular pizza among the veggies and is a common flavour among those who loves spice pizzas."
dish = Dish.create :title => "Peppy Paneer", :price => 17.90, :category_id => 1, :description => "Paneer is a fresh cheese common in South Asian Cuisine. It is an Indian Origin food item which is a delicious piece of cheese cube made of pure milk. This is a very popular recipe in India as the vegetarian people loves Paneer a lot. The Paneer used in this pizza are barbequed and then few pieces of Paneer is sprinkled over the pizza along with crispy capsicum slices and spicy red pepper. Its yummy taste and is really very appetizing. the Peppy Paneer pizza forms the spicy menu among the vegetarian list of pizzas."
dish = Dish.create :title => "Margherita Pizza", :price => 21.90, :category_id => 1, :description => "Pizza Margherita is a very common and a popular menu in the Asian countries. These pizzas are delicious and are made with single topping of Cheese. The Margherita Pizzas are medium spicy and are actually very pleasant to taste. The pizzas are preferred by the customers who like a simple pizza topping. These Pizzas has no extra toppings and are plain cheese pizzas."
dish = Dish.create :title => "Meatzaa Pizza", :price => 11.90, :category_id => 1, :description => "This is a non- vegetarian dish and is exclusively meant for you, if you are a hard core Non Vegetarian. This pizza is a blend of hot and spicy chicken, barbeque chicken and ham and minced meat. All this meat makes it a extravagant non veg. pizza. The Meatzaa Pizza is filled with cheese and is topped with sprinkled Onions. This is a perfect recipe for the non veg. pizzas which has all the forms of meat in the crispy fried form. Meatzaa Pizza definitely is the flavour to look for in the non veg. menu."
dish = Dish.create :title => "Cheese and Barbeque Chicken", :category_id => 1, :price => 12.90, :description => "The Cheese and Barbeque chicken Pizzas are the most popular among the pizza flavours. In countries like India where Ham and beef are not consumed largely, this flavour of pizza is the most popular among the consumers. The pizza is first filled with cheese and is topped with extra cheese and barbeque chicken. The barbeque chickens are made into small pieces which are sprinkled on the top of the extra cheese and are then sprinkled with some onions and green chilli. This is indeed a mouth watering pizza flavour for any non veg. pizza lover."

category = Category.create :name => "Hamburgers", :id => 2, :menu_id => 1

dish = Dish.create :title => "Taco Burgers", :category_id => 2, :price => 8.90, :description => "You'll be the taco of the town with these burgers from Taste and Tell, which are spiked with taco seasoning and studded with crushed tortilla chips. Finish up with taco fixins: melted jack, salsa, sour cream."
dish = Dish.create :title => "Chicken Caesar Burger", :category_id => 2, :price => 7.90, :description => "Wedge that salad between a bun like they do on blog Iowa Girl Eats with a ground chicken burger, parm, and Caesar dressing."
dish = Dish.create :title => "Canyon Creek Burger", :category_id => 2, :price => 12.90, :description => "Like breakfast, but better: This formidable burger recipe from blog Iowa Girl Eats stacks bacon, egg, fried jalapeños on a cheesy, beefy patty and then tops it off with a slick of blackberry jam or grape jelly."
dish = Dish.create :title => "Turkey Burger with a Twist", :category_id => 2, :price => 5.90, :description => "Blogger Spinach Tiger invents a zesty burger recipe with dark-meat turkey, fresh spinach, Worcestershire sauce, and an unlikely pop of flavor from chopped, dried plums. (Figs, cranberries, or raisins would work, too.)"




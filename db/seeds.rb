# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#####        A D M I N    A C C O U N T     ###########
user_a = User.new
user_a.email = "adminek@example.com"
user_a.firstname = "Adminek"
user_a.lastname = "Admini"
user_a.password = 'adminek123'
user_a.password_confirmation = 'adminek123'
user_a.admin = true
user_a.save!
###############################################

#####        NORMAL    A C C O U N T     ###########
user_n = User.new
user_n.email = "normal@example.com"
user_n.firstname = "Normals"
user_n.lastname = "Normin"
user_n.password = 'normal123'
user_n.password_confirmation = 'normal123'
user_n.save!
###############################################

4.times do 
	user = User.new
	user.email = Faker::Internet.email
	user.firstname = Faker::Internet.user_name
	user.lastname = Faker::Name.last_name
	user.password = 'passwd12345'
	user.password_confirmation = 'passwd12345'
	user.save!
end

9.times do
	Category.create(name: Faker::Commerce.department(2))
end
25.times do
	product = Product.new
	product.title = Faker::Lorem.word
	product.description = Faker::Lorem.paragraph
	product.price = Faker::Commerce.price	
	product.category_id = Random.rand(9) + 1
	product.user_id = user_a.id
	product.save!
end

25.times do
	product = Product.new
	product.title = Faker::Lorem.word
	product.description = Faker::Lorem.paragraph
	product.price = Faker::Commerce.price		
	product.category_id = Random.rand(9) + 1
	product.user_id = user_n.id
	product.save!

end

120.times do
	review = Review.new
	review.content = Faker::Lorem.sentence
	review.rating = Random.rand(5) + 1
	review.user_id = Random.rand(6) + 1
	review.product_id = Random.rand(50) + 1
	review.save!
end
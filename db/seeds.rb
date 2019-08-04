# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "faker"
system ("clear")
User.destroy_all
City.destroy_all
Gossip.destroy_all
Tag.destroy_all
Type.destroy_all
PrivateMessage.destroy_all
Comment.destroy_all
Like.destroy_all

10.times do 
	City.create(name: Faker::Nation.capital_city, zip_code: Faker::Address.zip_code)
end

c = City.all

10.times do 
	User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, 
	description: Faker::Hipster.paragraph(sentence_count: 2, supplemental: true, random_sentences_to_add: 2),
	email: Faker::Internet.email, age: rand(10..90), city: c[rand(0..9)])
end

u = User.all

20.times do 
	Gossip.create(title: Faker::Hipster.sentence(word_count: 4, supplemental: true, random_words_to_add: 2),
	content: Faker::Hipster.paragraph(sentence_count: rand(2..5), supplemental: true, random_sentences_to_add: rand(1..4)),
	user: u[rand(1..9)])
end

g = Gossip.all

10.times do
	Tag.create(title:"#{Faker::Internet.domain_word}")
end

h = Tag.all

40.times do
	Type.create(tag: h[rand(0..19)], gossip: g[rand(0..19)])
 end

x = Type.all

30.times do
	PrivateMessage.create(content: Faker::Hipster.paragraph(sentence_count: rand(1..4), supplemental: true, random_sentences_to_add: rand(1..3)), 
	sender: u[rand(0..9)], recipient: u[rand(0..9)])
end
mp = PrivateMessage.all

20.times do
	Comment.create(content: Faker::Hipster.paragraph(sentence_count: rand(1..6), supplemental: true, random_sentences_to_add: rand(2..4)),
	gossip: g[rand(0..19)], user: u[rand(0..10)])
end

cm =Comment.all

20.times do
	puts Like.create(user: u[rand(0..9)], gossip: g[rand(0..19)], comment: cm[rand(0..19)] )
end
 
l = Like.all



tp c
tp u, :id, :first_name, :description, :email, :city
tp g
tp h
tp x
tp mp
tp cm, :user, :gossip, :content
tp l
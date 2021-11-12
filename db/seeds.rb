# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
6.times do |i|
	user = User.create(name: "User ##{i+1}", bio: "A bio.", posts_counter: 0)
	3.times do |y|
		post = Post.create(title: "Post ##{y+1} of User##{i+1}", text: "Lorem Ipsum Dolor Sit Amet", user: user, comments_counter: 0, likes_counter:0)
		5.times do |j|
			Comment.create(text: "Comment ##{j+1}", post: post, user: user)
		end
	end
end
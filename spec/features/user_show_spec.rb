# frozen_string_literal: true

​
describe 'The User Show Process', type: :feature do
  before :each do
    @user = User.new
    @user.name = 'User_#199'
    @user.bio = 'A bio.'
    @user.posts_counter = 0
    @user.email = 'test199@example.com'
    @user.password = 'taawktljasktlw4aaglj'
    @user.skip_confirmation!
    @user.save!
    @user1 = User.new
    @user1.name = 'User_#15'
    @user1.bio = 'A bio.'
    @user1.posts_counter = 0
    @user1.email = 'test15@example.com'
    @user1.password = 'taawktljasktlw4aaglj'
    @user1.skip_confirmation!
    @user1.save!
    @user2 = User.new
    @user2.name = 'filler'
    @user2.bio = 'this is my bio'
    @user2.posts_counter = 0
    @user2.email = 'filler@example.com'
    @user2.password = 'taawktljasktlw4aaglj'
    @user2.skip_confirmation!
    @user2.save!
    @user3 = User.new
    @user3.name = 'Bob'
    @user3.bio = 'i am Bob'
    @user3.posts_counter = 0
    @user3.email = 'Bobberd@example.com'
    @user3.password = 'taawktljasktlw4aaglj'
    @user3.skip_confirmation!
    @user3.save!
    3.times do |y|
    post = Post.create(title: "Post ##{y + 1} of User#1", text: 'Lorem Ipsum Dolor Sit Amet', user: @user1, comments_counter: 0, likes_counter: 0)
    5.times do |j|
        Comment.create(text: "Comment ##{j + 1}", post: post, user: @user1)
    end
    end
    visit '/users/sign_in'
    within('#new_user') do
    fill_in 'user_email', with: 'test199@example.com'
    fill_in 'user_password', with: 'taawktljasktlw4aaglj'
    end
    click_button 'Log in'
end
it 'I can see the username of the user.' do
    visit "/users/#{@user1.id}"
    expect(page).to have_content @user1.name
    Post.destroy_by(user_id: @user1.id)
    User.delete(@user1.id)
    User.delete(@user2.id)
    User.delete(@user3.id)
    User.delete(@user.id)
end
it 'I can see the user profile pic.' do
    visit "/users/#{@user1.id}"
    e = find("#user-#{@user1.id}-pfp")
    flag = false
    flag = true unless e.nil?
    Post.destroy_by(user_id: @user1.id)
    User.delete(@user1.id)
    User.delete(@user2.id)
    User.delete(@user3.id)
    User.delete(@user.id)
    expect(flag).to eq(true)
end
it 'I can see the user profile pic.' do
    visit "/users/#{@user1.id}"
    expect(page).to have_content "numbers of posts: #{@user1.posts.size}"
    Post.destroy_by(user_id: @user1.id)
    User.delete(@user1.id)
    User.delete(@user2.id)
    User.delete(@user3.id)
    User.delete(@user.id)
  end
  it 'I can see the user bio.' do
    visit "/users/#{@user1.id}"
    expect(page).to have_content @user1.bio​
    Post.destroy_by(user_id: @user1.id)
    User.delete(@user1.id)
    User.delete(@user2.id)
    User.delete(@user3.id)
    User.delete(@user.id)
  end
  it 'I can see the first 3 post of the user.' do
    visit "/users/#{@user1.id}"
    a = Post.where(user_id: @user1.id).take(3) ​
    Post.destroy_by(user_id: @user1.id)
    User.delete(@user1.id)
    User.delete(@user2.id)
    User.delete(@user3.id)
    User.delete(@user.id)
    a.each do |i|
    expect(page).to have_content i.title.to_s
    end
  end
  it "I can see a button that lets me view all of a user's posts." do
    visit "/users/#{@user1.id}" ​
    Post.destroy_by(user_id: @user1.id)
    User.delete(@user1.id)
    User.delete(@user2.id)
    User.delete(@user3.id)
    User.delete(@user.id)
    a = find_button('See all post')
    a = true unless a.nil?
    expect(a).to eq(true)
  end
  it 'If i click on a post, it redirect me to the post page.' do
    visit "/users/#{@user1.id}"
    click_on @user1.posts[0].title
    post = @user1.posts[0].id
    expect(current_path).to eq("/users/#{@user1.id}/posts/#{post}")
    Post.destroy_by(user_id: @user1.id)
    User.delete(@user1.id)
    User.delete(@user2.id)
    User.delete(@user3.id)
    User.delete(@user.id)
  end​
  it 'There is a button to see all the posts of a user.' do
    visit "/users/#{@user1.id}"
    a = find('#next-link')
    a = true unless a.nil?
    expect(a).to eq(true)
    Post.destroy_by(user_id: @user1.id)
    User.delete(@user1.id)
    User.delete(@user2.id)
    User.delete(@user3.id)
    User.delete(@user.id)
  end
  it "When I click to see all posts, it redirects me to the user's post's index    page." do
    visit "/users/#{@user1.id}"
    find('#next-link').click
    expect(current_path).to eq("/users/#{@user1.id}/posts")
    Post.destroy_by(user_id: @user1.id)
    User.delete(@user1.id)
    User.delete(@user2.id)
    User.delete(@user3.id)
    User.delete(@user.id)
  end
end

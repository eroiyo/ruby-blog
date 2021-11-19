describe "The User Show Process", type: :feature do
    before :each do
        @user = User.new
        @user.name = "User_#199"
        @user.bio = "A bio."
        @user.posts_counter = 0
        @user.email= "test199@example.com"
        @user.password  = "taawktljasktlw4aaglj"
        @user.skip_confirmation!
        @user.save!

        @user1 = User.new
        @user1.name = "User_#15"
        @user1.bio = "A bio."
        @user1.posts_counter = 0
        @user1.email= "test15@example.com"
        @user1.password  = "taawktljasktlw4aaglj"
        @user1.skip_confirmation!
        @user1.save!

        @user2 = User.new
        @user2.name = "filler"
        @user2.bio = "this is my bio"
        @user2.posts_counter = 0
        @user2.email= "filler@example.com"
        @user2.password  = "taawktljasktlw4aaglj"
        @user2.skip_confirmation!
        @user2.save!

        @user3 = User.new
        @user3.name = "Bob"
        @user3.bio = "i am Bob"
        @user3.posts_counter = 0
        @user3.email= "Bobberd@example.com"
        @user3.password  = "taawktljasktlw4aaglj"
        @user3.skip_confirmation!
        @user3.save!

        3.times do |y|
            post = Post.create(title: "Post ##{y+1} of User#1", text: "Lorem Ipsum Dolor Sit Amet", user: @user1, comments_counter: 0, likes_counter:0,)
            5.times do |j|
                Comment.create(text: "Comment ##{j+1}", post: post, user: @user1)
            end
        end

        visit '/users/sign_in'
        within("#new_user") do
          fill_in 'user_email', with: 'test199@example.com'
          fill_in 'user_password', with: 'taawktljasktlw4aaglj'
        end
        click_button 'Log in'

    end

    it "I can see the username of the user." do
        visit "/users/#{@user1.id}/posts"
        Post.destroy_by(user_id: @user1.id)
        User.delete(@user1.id)
        User.delete(@user2.id)
        User.delete(@user3.id)
        User.delete(@user.id)
        expect(page).to have_content @user1.name
    end

    it "I can see the number of posts the user have" do
        visit "/users/#{@user1.id}/posts"
        expect(page).to have_content "numbers of posts: #{@user1.posts.size}"
        Post.destroy_by(user_id: @user1.id)
        User.delete(@user1.id)
        User.delete(@user2.id)
        User.delete(@user3.id)
        User.delete(@user.id)
    end

    it "I can see the profile picture for the user." do
        visit "/users/#{@user1.id}/posts"
        e = nil
        flag = true
        e = find("#user-#{@user1.id}-pfp")
        if e == nil
            flag = false
        end
        Post.destroy_by(user_id: @user1.id)
        User.delete(@user1.id)
        User.delete(@user2.id)
        User.delete(@user3.id)
        User.delete(@user.id)
        expect(flag).to eq(true)
    end

    it "I can see a post title of the user." do
        visit "/users/#{@user1.id}/posts"
        expect(page).to have_content @user1.posts[0].title
        Post.destroy_by(user_id: @user1.id)
        User.delete(@user1.id)
        User.delete(@user2.id)
        User.delete(@user3.id)
        User.delete(@user.id)
    end

    it "I can see some of the post's body." do
        visit "/users/#{@user1.id}/posts"
        expect(page).to have_content @user1.posts[0].text
        Post.destroy_by(user_id: @user1.id)
        User.delete(@user1.id)
        User.delete(@user2.id)
        User.delete(@user3.id)
        User.delete(@user.id)
    end

    it "I can see the first comment on a post." do
        visit "/users/#{@user1.id}/posts"
        expect(page).to have_content @user1.posts[0].comments[0].text
        Post.destroy_by(user_id: @user1.id)
        User.delete(@user1.id)
        User.delete(@user2.id)
        User.delete(@user3.id)
        User.delete(@user.id)
    end

    it "I can see how many comments a post has." do
        visit "/users/#{@user1.id}/posts"
        expect(page).to have_content "comments #{@user1.posts[0].comments.size}"
        Post.destroy_by(user_id: @user1.id)
        User.delete(@user1.id)
        User.delete(@user2.id)
        User.delete(@user3.id)
        User.delete(@user.id)
    end

    it "I can see how many likes a post has." do
        visit "/users/#{@user1.id}/posts"
        expect(page).to have_content ", likes #{@user1.posts[0].likes.size}"
        Post.destroy_by(user_id: @user1.id)
        User.delete(@user1.id)
        User.delete(@user2.id)
        User.delete(@user3.id)
        User.delete(@user.id)
    end

    it "I can see a section for pagination if there are more posts than fit on the view." do
        visit  "/users/#{@user1.id}/posts"

        Post.destroy_by(user_id: @user1.id)
        User.delete(@user1.id)
        User.delete(@user2.id)
        User.delete(@user3.id)
        User.delete(@user.id)
        a = find("#next-link")
        if a != nil
            a=true
        end
        expect(a).to eq(true)
    end

    it "If i click on a post, it redirect me to the post page." do
        visit "/users/#{@user1.id}/posts"
        click_on @user1.posts[0].title
        post = @user1.posts[0].id
        expect(current_path).to eq("/users/#{@user1.id}/posts/#{post}")
        Post.destroy_by(user_id: @user1.id)
        User.delete(@user1.id)
        User.delete(@user2.id)
        User.delete(@user3.id)
        User.delete(@user.id)
    end
    
end
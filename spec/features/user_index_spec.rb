describe "The User Index process", type: :feature do
    before :each do
        @user = User.new
        @user.name = "User_#11"
        @user.bio = "A bio."
        @user.posts_counter = 0
        @user.email= "test11@example.com"
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

        visit '/users/sign_in'
        within("#new_user") do
          fill_in 'user_email', with: 'test11@example.com'
          fill_in 'user_password', with: 'taawktljasktlw4aaglj'
        end
        click_button 'Log in'
    end

    it "I can see the username of all other users." do
        visit '/'
        for i in User.all
            expect(page).to have_content i.name
        end
        User.delete(@user1.id)
        User.delete(@user2.id)
        User.delete(@user3.id)
        User.delete(@user.id)
    end

    it "I can see the number of posts each user has written" do
        visit '/'
        for i in User.all
            expect(page).to have_content "numbers of posts: #{i.posts.size}"
        end
        User.delete(@user1.id)
        User.delete(@user2.id)
        User.delete(@user3.id)
        User.delete(@user.id)
    end
    
    it "When I click on a user, I am redirected to that user's show page." do
        visit '/'
        click_on @user.name

        User.delete(@user1.id)
        User.delete(@user2.id)
        User.delete(@user3.id)
        User.delete(@user.id)
        expect(current_path).to eq("/users/#{@user.id}")
    end

    it "I can see the profile picture for each user." do
        visit '/'
        e = nil
        flag = true
        for i in User.all
            e = nil
            e = find("#user-#{i.id}-pfp")
            if e == nil
                flag = false
                break
            end
        end
        User.delete(@user1.id)
        User.delete(@user2.id)
        User.delete(@user3.id)
        User.delete(@user.id)
        expect(flag).to eq(true)
    end
end
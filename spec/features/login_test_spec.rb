describe "the signin process", type: :feature do
    before :each do
        @user = User.new
        @user.name = "User_#11"
        @user.bio = "A bio."
        @user.posts_counter = 0
        @user.email= "test11@example.com"
        @user.password  = "taawktljasktlw4aaglj"
        @user.skip_confirmation!
        @user.save!
    end
  
    it "When I click the submit button after filling in the username and the password with correct data, I am redirected to the root page, " do
      visit '/users/sign_in'
      within("#new_user") do
        fill_in 'user_email', with: 'test11@example.com'
        fill_in 'user_password', with: 'taawktljasktlw4aaglj'
      end
      click_button 'Log in'
      puts(current_path)
      User.delete(@user.id)
      expect(current_path).to eq("/")
    end

    it "The forms fields are visible" do
        visit '/users/sign_in'
        a = false
        b = false
        within("#new_user") do
            a = fill_in 'user_email', with: 'test11@example.com'
            b = fill_in 'user_password', with: 'taawktljasktlw4aaglj'
        end
        User.delete(@user.id)
        expect(a && b).to eq(true)
      end

    it "When I click the submit button without filling in the username and the password, I get a detailed error." do
        visit '/users/sign_in'
        within("#new_user") do
          fill_in 'user_email', with: ''
          fill_in 'user_password', with: ''
        end
        click_button 'Log in'
        User.delete(@user.id)
        expect(page).to have_content 'Invalid Email or password'
      end

          it "When I click the submit button after filling in the username and the password with incorrect data, I get a detailed error." do
        visit '/users/sign_in'
        within("#new_user") do
          fill_in 'user_email', with: 'notanemail'
          fill_in 'user_password', with: 'short'
        end
        click_button 'Log in'
        User.delete(@user.id)
        expect(page).to have_content 'Invalid Email or password'
      end
  end
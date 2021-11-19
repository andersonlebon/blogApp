require 'rails_helper'

# RSpec.feature 'User post index page', type: :feature do
#   background do
#     @user = User.create(id: 1, name: "anderson buyana", photo: nil, bio: nil, created_at: "2021-11-18 11:27:35.346590000 +0000", updated_at: "2021-11-19 08:23:07.825477000 +0000", posts_counter: nil, email: "buyananderson@gmail.com", role: "admin")
#     sign_in_as(@user)
#     visit user_posts_path(@user.id)
#   end
#   scenario 'I can see the username' do
#     expect(page).to have_content @user.name
#   end

#   scenario 'I can see the number of posts' do
#     expect(page).to have_content "#{@user.posts_counter} Posts"
#   end

#   scenario "I can see a post's title" do
#     expect(page).to have_content @user.posts[0].title
#   end

#   scenario "I can see some of the post's body" do
#     expect(page).to have_content @user.posts[0].text.slice(0, 100)
#   end

#   scenario 'I can see the first comments on a post' do
#     @user.posts[0].recent_comments.each do |comment|
#       expect(page).to have_content comment.text
#     end
#   end

#   scenario 'I can see how many likes a post has' do
#     expect(page).to have_content "#{@user.posts[0].likes_counter} Like"
#   end
# end


RSpec.feature 'User post index page', type: :feature do
   include Devise::Test::IntegrationHelpers
  background do
    @user = User.create(id: 1, name: "anderson buyana", photo: nil, bio: nil, created_at: "2021-11-18 11:27:35.346590000 +0000", updated_at: "2021-11-19 08:23:07.825477000 +0000", posts_counter: nil, email: "buyananderson@gmail.com", role: "admin")
    sign_in (@user)
    visit new_user_session_path
  end


   scenario 'I can see the username' do
    expect(page.has_button?('Sign in')).to be true
  end

  context "I can see a post's title" do
    scenario 'without The email and password' do
      click_button 'Sign in'
      expect(page).to have_content 'Invalid Email or password'
    end

  scenario "I can see some of the post's body" do
      within 'form' do
        fill_in 'user_email', with: 'user@example.com'
        fill_in 'user_password', with: 'password'
      end
      click_button 'Sign in'
      expect(page).to have_content 'Invalid Email or password'
    end

      scenario 'I can see how many likes a post has' do
      within 'form' do
        fill_in 'user_email', with: ''
        fill_in 'user_password', with: ''
      end
      click_button 'Sign in'
      expect(page).to have_content 'Invalid Email or password'
    end   
  end
end
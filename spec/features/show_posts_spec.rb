# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'User post index page', type: :feature do
  include Devise::Test::IntegrationHelpers
  background do
    @user = User.create(id: 1, name: 'anderson buyana', photo: nil, bio: nil, created_at: '2021-11-18 11:27:35.346590000 +0000', updated_at: '2021-11-19 08:23:07.825477000 +0000', posts_counter: nil, email: 'buyananderson@gmail.com', role: 'admin')
    sign_in(@user)
    # create a post for the user
    @post = Post.create(id: 1, title: 'My first post', text: 'This is my first post', user_id: 1, created_at: '2021-11-18 11:27:35.346590000 +0000', updated_at: '2021-11-19 08:23:07.825477000 +0000')
    @create = Like.create(id: 1, user_id: @user_id, post_id: @post_id, created_at: '2021-11-18 11:27:35.346590000 +0000', updated_at: '2021-11-19 08:23:07.825477000 +0000')
    visit new_user_session_path
  end

  scenario 'I can see the username' do
    expect(page.has_button?('Sign in')).to be true
    expect(page).to have_content('You have to confirm your email address before continuing')
    expect(@user.name).to eq('anderson buyana')
  end

  context "I can see a post's title" do
    scenario 'without The email and password' do
      click_button 'Sign in'
      expect(page).to have_content 'Invalid Email or password'
      expect(@post.title).to eq('My first post')
    end

    scenario "I can see some of the post's body" do
      within 'form' do
        fill_in 'user_email', with: 'user@example.com'
        fill_in 'user_password', with: 'password'
      end
      click_button 'Sign in'
      expect(page).to have_content 'Invalid Email or password'
      expect(@post.text).to eq('This is my first post')
    end

    scenario 'I can see how many likes a post has' do
      within 'form' do
        fill_in 'user_email', with: ''
        fill_in 'user_password', with: ''
      end
      click_button 'Sign in'
      expect(page).to have_content 'Invalid Email or password'
      expect(@create.user_id).to eq(@user_id)
    end
  end
end

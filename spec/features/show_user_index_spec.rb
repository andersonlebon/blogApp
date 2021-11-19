# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'User post index page', type: :feature do
  include Devise::Test::IntegrationHelpers
  background do
    @user = User.create(id: 1, name: 'anderson buyana', photo: nil, bio: nil, created_at: '2021-11-18 11:27:35.346590000 +0000', updated_at: '2021-11-19 08:23:07.825477000 +0000', posts_counter: nil, email: 'buyananderson@gmail.com', role: 'admin')
    sign_in(@user)
    visit new_user_session_path
  end

  scenario 'I can see the username of all other users' do
    # check username
    expect(@user.name).to be == 'anderson buyana'
  end

  context 'I can see the profile picture for each user' do
    scenario 'without The email and password' do
      click_button 'Sign in'
      expect(page).to have_content 'Invalid Email or password'
    end

    scenario 'I can see the number of posts each user has written' do
      within 'form' do
        fill_in 'user_email', with: 'user@example.com'
        fill_in 'user_password', with: 'password'
      end
      click_button 'Sign in'
      expect(page).to have_content 'Invalid Email or password'
    end

    scenario 'When I click on a user, I am redirected to that users show page' do
      within 'form' do
        fill_in 'user_email', with: ''
        fill_in 'user_password', with: ''
      end
      click_button 'Sign in'
      expect(page).to have_content 'Invalid Email or password'
    end
  end
end

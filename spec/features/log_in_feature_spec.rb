require 'rails_helper'

RSpec.feature 'Logins', type: :feature do
  background { visit new_user_session_path }

  scenario 'Page has a login form' do
    expect(page.has_field?('user_email')).to be true
    expect(page.has_field?('user_password')).to be true
    expect(page.has_button?('Sign in')).to be true
  end

  context 'Submit' do
    scenario 'without The email and password' do
      click_button 'Sign in'
      expect(page).to have_content 'Invalid Email or password'
    end

    scenario 'with incorrect email and password' do
      within 'form' do
        fill_in 'user_email', with: 'user@example.com'
        fill_in 'user_password', with: 'password'
      end
      click_button 'Sign in'
      expect(page).to have_content 'Invalid Email or password'
    end

    scenario 'with correct email and password' do
      within 'form' do
        fill_in 'user_email', with: ''
        fill_in 'user_password', with: ''
      end
      click_button 'Sign in'
      expect(page).to have_content 'Invalid Email or password'
    end   
  end
end
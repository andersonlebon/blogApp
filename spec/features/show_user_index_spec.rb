require 'rails_helper'

RSpec.feature 'Logins', type: :feature do
  background { visit new_user_session_path }

  scenario 'Page has a login form' do
    expect(page.has_field?('user_email')).to be true
    expect(page.has_field?('user_password')).to be true
    expect(page.has_button?('Sign in')).to be true
  end

    scenario 'I can see the username of all other users' do
    # check username
     @user = User.create(name: 'Anderson', email: 'user@example.com', password: 'password', confirmed_at: Time.now, )
     within 'form' do
        fill_in 'user_email', with: @user.email
        fill_in 'user_password', with: @user.password
      end
      click_button 'Sign in'
    expect(page).to have_content 'Anderson'
    end


    scenario 'I can see the profile picture for each user' do
       @user = User.create(name: 'Anderson', photo: "http/url/picture", email: 'user@example.com', password: 'password', confirmed_at: Time.now, )
       within 'form' do
        fill_in 'user_email', with: @user.email
        fill_in 'user_password', with: @user.password
      end
      click_button 'Sign in'
      expect(page).to have_content 'http/url/picture'
    end



  scenario 'I can see the profile picture for each user' do
       @user = User.create(name: 'Anderson', photo: "http/url/picture", email: 'user@example.com', password: 'password', confirmed_at: Time.now, )
      #  create a user post
      @post = @user.posts.create(title: 'post title', text: 'post body', user_id: @user.id)
      @post.save
       within 'form' do
        fill_in 'user_email', with: @user.email
        fill_in 'user_password', with: @user.password
      end
      click_button 'Sign in'
      expect(page).to have_content "Number of poste: #{@user.posts.count}"
    end


    scenario 'When I click on a user, I am redirected to that users show page' do
       @user = User.create(name: 'Anderson lebon', photo: "http/url/picture", email: 'user@example.com', password: 'password', confirmed_at: Time.now, )
       within 'form' do
        fill_in 'user_email', with: @user.email
        fill_in 'user_password', with: @user.password
      end
      click_button 'Sign in'
      expect(page.has_link?('Anderson lebon')).to be true
    end

end

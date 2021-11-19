require 'rails_helper'

RSpec.feature 'User post index page', type: :feature do
  include Devise::Test::IntegrationHelpers
    background do
      @user = FactoryGirl.create(:user)
      @user.confirm
      @post = FactoryGirl.create(:post, user: @user)
    end
    
    scenario 'User can see all posts' do
      sign_in @user
      visit posts_path
      expect(page).to have_content @post.title
    end

    scenario 'User can see all posts' do
        user = FactoryGirl.create(:user)
        user.confirm
        post = FactoryGirl.create(:post, user: user)
        sign_in user
        visit posts_path
        expect(page).to have_content post.title
        end

    scenario 'User can see all posts' do
        user = FactoryGirl.create(:user)
        user.confirm
        post = FactoryGirl.create(:post, user: user)
        sign_in user
        visit posts_path
        expect(page).to have_content post.title
        end
    
    




end
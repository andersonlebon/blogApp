# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = current_user
    @posts = @user.posts
  end
end

# frozen_string_literal: true

require 'rails_helper'

# write test for all Post modul methods
RSpec.describe Post, type: :model do
  # create a new post object
  let(:post) { Post.new }
  # test if the post object is not valid
  it 'is not valid without a title' do
    post.title = nil
    expect(post).to_not be_valid
  end

  # test if the post object is not valid
  it 'is not valid without a user' do
    post.user = nil
    expect(post).to_not be_valid
  end
end

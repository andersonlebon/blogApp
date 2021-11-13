require 'rails_helper'

# write test for Like model here
RSpec.describe Comment, type: :model do
  it 'is invalid without a body' do
      expect(Comment.new(text: nil)).to be_invalid # rubocop:todo Layout/IndentationWidth
  end

  it 'is invalid without a user' do
    expect(Comment.new(user: nil)).to be_invalid
  end

  # test user association with new comment
  it 'belongs to a user' do
    user = User.create(name: 'wale', bio: 'bio')
      comment = Comment.create(text: 'text', user: user) # rubocop:todo Layout/IndentationConsistency
      expect(comment.user).to eq(user) # rubocop:todo Layout/IndentationConsistency
  end

  # test post association with new comment
  it 'belongs to a post' do
    post = Post.create(title: 'title', user: User.create(name: 'wale', bio: 'bio'))
      comment = Comment.create(text: 'text', post: post) # rubocop:todo Layout/IndentationConsistency
      expect(comment.post).to eq(post) # rubocop:todo Layout/IndentationConsistency
  end

  # test post association with new comment
  it 'belongs to a post' do
    post = Post.create(title: 'title', user: User.create(name: 'wale', bio: 'bio'))
      comment = Comment.create(text: 'text', post: post) # rubocop:todo Layout/IndentationConsistency
      expect(comment.post).to eq(post) # rubocop:todo Layout/IndentationConsistency
  end

  # test number of comments for a post
  it 'has a number of comments' do
    post = Post.create(title: 'title', user: User.create(name: 'wale', bio: 'bio'))
      # rubocop:todo Layout/IndentationConsistency
      comment = Comment.create(text: 'text', post: post) # rubocop:todo Lint/UselessAssignment
      # rubocop:enable Layout/IndentationConsistency
      expect(post.comments.count).to eq(0) # rubocop:todo Layout/IndentationConsistency
  end

  it 'is invalid without a post' do
    expect(Comment.new(post: nil)).to be_invalid
  end
end

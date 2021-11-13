require 'rails_helper'


# write test for Like model here
RSpec.describe Comment, type: :model do
    it "is invalid without a body" do
        expect(Comment.new(text: nil)).to be_invalid
    end

    it "is invalid without a user" do
        expect(Comment.new(user: nil)).to be_invalid
    end

    # test user association with new comment
    it "belongs to a user" do
        user = User.create(name: 'wale', bio: 'bio')
        comment = Comment.create(text: 'text', user: user)
        expect(comment.user).to eq(user)
    end

    # test post association with new comment
    it "belongs to a post" do
        post = Post.create(title: 'title', user: User.create(name: 'wale', bio: 'bio'))
        comment = Comment.create(text: 'text', post: post)
        expect(comment.post).to eq(post)
    end

    # test post association with new comment
    it "belongs to a post" do
        post = Post.create(title: 'title', user: User.create(name: 'wale', bio: 'bio'))
        comment = Comment.create(text: 'text', post: post)
        expect(comment.post).to eq(post)
    end


    # test number of comments for a post
    it "has a number of comments" do
        post = Post.create(title: 'title', user: User.create(name: 'wale', bio: 'bio'))
        comment = Comment.create(text: 'text', post: post)
        expect(post.comments.count).to eq(0)
    end

    it "is invalid without a post" do
        expect(Comment.new(post: nil)).to be_invalid
    end
end


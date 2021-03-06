# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes
  validates :title, :text, presence: true

  validates :title, presence: { message: 'Title must not be blank' },
                    length: { maximum: 250, too_long: 'Title must not exceed 250 characters' }
  validates_numericality_of :comments_counter, only_integer: true, greater_than_or_equal: 0
  validates_numericality_of :like_counter, only_integer: true, greater_than_or_equal: 0

  def update_post_counter
    user.update_column('posts_counter', user.posts_counter + 1)
  end

  def most_recent_comments(limit = 5)
    comments.order(created_at: :desc).limit(limit)
  end
end

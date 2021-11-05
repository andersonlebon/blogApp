class AddLikeCounterToPost < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :like_counter, :integer
  end
end

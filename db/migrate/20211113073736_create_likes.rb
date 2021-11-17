class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    # add_index :likes, %i[user_id post_id], unique: true
    create_table :likes do |t|
      t.integer :user_id
      t.integer :post_id


       t.timestamps

    end
  end
end

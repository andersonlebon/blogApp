class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.refrences :user, null: false, foreign_key: true
      t.refrences :post, null: false, foreign_key: true

      t.timestamps
    end

    add_index :likes, [:user_id, :post_id], unique: true
  end
end

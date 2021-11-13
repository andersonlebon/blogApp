class CreatePostProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :post_products do |t|

      t.timestamps
    end
  end
end

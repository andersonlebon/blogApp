class AddColumnsToPost < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :liked, :boolean
  end
end

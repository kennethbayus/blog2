class ModifyPostsTable < ActiveRecord::Migration
  def change
    add_column :posts, :tagline, :string
    add_column :posts, :user_id, :integer
  end
end

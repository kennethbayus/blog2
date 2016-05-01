class AddTimestampsDeleteCats < ActiveRecord::Migration
  def change
    add_timestamps :posts
    drop_table :cats
  end
end

class AddPhotosToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :photos, :string, array: true, default: []
  end
end

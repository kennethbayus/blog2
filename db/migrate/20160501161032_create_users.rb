class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :printname
      t.string :password_digest
      t.string :tagline
      t.timestamps
    end
  end
end

class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :url
      t.datetime :published_at
    end
    add_index :posts, :url
    add_index :posts, :published_at
  end
end
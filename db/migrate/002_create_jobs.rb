class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.references :post
      t.string :user
      t.text :description
      t.string :url
      t.datetime :published_at
    end
    add_index :jobs, :post_id
    add_index :jobs, :published_at
    add_index :jobs, :url
  end
end
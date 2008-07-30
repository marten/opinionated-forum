class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.text :body
      t.references :topic
      t.references :user

      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end

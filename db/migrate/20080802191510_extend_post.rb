class ExtendPost < ActiveRecord::Migration
  def self.up
    add_column :posts, :kind, :string, :default => "text"
  end

  def self.down
    remove_column :posts, :kind
  end
end

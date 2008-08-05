class ExtendUser < ActiveRecord::Migration
  def self.up
    add_column :users, :email, :string
    add_column :users, :admin, :boolean
  end

  def self.down
    remove_column :users, :email
    remove_column :users, :admin
  end
end

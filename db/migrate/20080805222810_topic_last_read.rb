class TopicLastRead < ActiveRecord::Migration
  def self.up
    create_table :viewings do |t|
      t.references :topic
      t.references :user
      t.datetime :seen, :null => false, :default => "NOW()"
    end
    
    add_column :users, :all_read_upto, :datetime, :default => "NOW()"
  end

  def self.down
    drop_table :viewings
    remove_column :users, :all_read_upto
  end
end

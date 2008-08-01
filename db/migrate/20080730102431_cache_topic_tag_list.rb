class CacheTopicTagList < ActiveRecord::Migration
  def self.up
    add_column :topics, :cached_tag_list, :string
    
  end

  def self.down
    remove_column :topics, :cached_tag_list
  end
end

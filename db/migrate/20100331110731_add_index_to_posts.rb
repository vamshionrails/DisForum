class AddIndexToPosts < ActiveRecord::Migration
  def self.up
    add_index :posts, :forum_id
    add_index :posts, :user_id
  end

  def self.down
    remove_index :posts, :forum_id
    remove_index :posts, :user_id
  end
end

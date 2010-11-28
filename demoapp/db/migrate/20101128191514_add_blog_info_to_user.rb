class AddBlogInfoToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :blog_name, :string
    add_column :users, :blog_slug, :string
  end

  def self.down
    remove_column :users, :blog_slug
    remove_column :users, :blog_name
  end
end

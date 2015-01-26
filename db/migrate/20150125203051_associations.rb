class Associations < ActiveRecord::Migration
  def change
  	add_column :beans, :user_id, :integer
  	add_column :users, :bean_id, :integer

  	add_column :comments, :user_id, :integer
  	add_column :users, :comment_id, :integer

  	add_column :comments, :bean_id, :integer
  	add_column :beans, :comment_id, :integer
  end
end

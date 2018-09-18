class AddPackageIdToUsers < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :package_id, :integer
  end
end

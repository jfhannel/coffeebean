class AddPackageIdToBeans < ActiveRecord::Migration
  def change
  	add_column :beans, :package_id, :integer
  end
end

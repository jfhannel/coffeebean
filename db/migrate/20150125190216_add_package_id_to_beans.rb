class AddPackageIdToBeans < ActiveRecord::Migration[5.2]
  def change
  	add_column :beans, :package_id, :integer
  end
end

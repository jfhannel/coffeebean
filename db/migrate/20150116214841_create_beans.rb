class CreateBeans < ActiveRecord::Migration[5.2]
  	def change
    	create_table :beans do |t|
    		t.string :name
    		t.string :country
    		t.text :description

      		t.timestamps
    	end
  	end
end

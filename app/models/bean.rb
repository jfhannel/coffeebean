class Bean < ActiveRecord::Base
	has_many :comments
	has_many :users
	has_many :packages
end

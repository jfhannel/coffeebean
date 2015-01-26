class User < ActiveRecord::Base
	has_many :beans
	has_many :comments
	has_many :packages
end

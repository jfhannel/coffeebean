class Comment < ActiveRecord::Base
	belongs_to :bean
	belongs_to :user
end

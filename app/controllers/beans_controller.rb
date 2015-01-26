require 'json'

class BeansController < ApplicationController
	def get_beans
		@all_beans = Bean.all

		respond_to do |format|
			format.json { render json: @all_beans }
		end
    end

    def save
    	if params[:beans].length > 0 then
	    	beans = params[:beans]
	    	beans.each do |bean|
	    		nb = nil
	    		if bean["id"] then
	    			nb = Bean.find bean["id"]
	    		end
	    		if not nb then 
	    			nb = Bean.new
	    		end
    			nb.name = bean["name"]
    			nb.description = bean["description"]
    			nb.country = bean["country"]
				nb.save
	    	end
	    end

    	render nothing: true
    end

    def remove
    	if params[:beans].length > 0 then
	    	beans = params[:beans]
	    	beans.each do |bean|
				ob = Bean.find bean["id"]
				ob.destroy
	    	end
	    end

    	render nothing: true
    end

end

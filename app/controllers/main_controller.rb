class MainController < ApplicationController

	def get_users
		@all_users = User.all

		respond_to do |format|
			format.json { render json: @all_users }
		end
    end

    def get_beans
		@all_beans = Bean.all

		respond_to do |format|
			format.json { render json: @all_beans }
		end
    end

    def get_beans_of_user
    	userid = params[:curruser]
    	curruser = User.find(userid)

    	respond_to do |format|
			format.json { render json: curruser.beans }
		end
	end

	def get_beans_in_package
		packageid = params[:currpackage]
		currpackage = Package.find(packageid)

		respond_to do |format|
			format.json { render json: currpackage.beans }
		end
	end

	def mark_beans
		userid = params[:curruser]
    	curruser = User.find(userid)

    	params[:beans].each do |beanid|
    		curruser.beans << Bean.find(beanid)
    	end

    	render nothing: true
    end

    def get_packages
		@all_packages = Package.all

		respond_to do |format|
			format.json { render json: @all_packages }
		end
    end

    def get_comments_of_bean
    	beanid = params[:beanid]
    	bean = Bean.find(beanid)

		respond_to do |format|
			format.json { render json: bean.comments }
		end    	
	end

	def save_comment
		userid = params[:userid]
		beanid = params[:beanid]
		commentbody = params[:commentbody]

		comment = Comment.new
		comment.body = commentbody
		comment.save

		User.find(userid).comments << comment
		Bean.find(beanid).comments << comment

		render nothing: true
	end

    def save_users
    	if params[:users].length > 0 then
	    	users = params[:users]
	    	users.each do |user|
	    		nu = nil
	    		if user["id"] then
	    			nu = User.find user["id"]
	    		end
	    		if not nu then 
	    			nu = User.new
	    		end
    			nu.name = user["name"]
				nu.save
	    	end
	    end

    	render nothing: true
    end

    def save_beans
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

    def save_packages
    	if params[:packages].length > 0 then
	    	packages = params[:packages]
	    	packages.each do |package|
	    		print package
	    		np = nil
	    		if package["id"] then
	    			np = Package.find package["id"]
	    		end
	    		if not np then 
	    			np = Package.new
	    		end
    			np.name = package["name"]
    			if package["beanids"] then
	    			package["beanids"].each do |id|
	    				np.beans << Bean.find(id)
	    			end
	    		end
    			np.user = User.find(package["ownerid"])
				np.save
	    	end
	    end

    	render nothing: true
    end

    def remove_beans
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

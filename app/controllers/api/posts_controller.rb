module Api
	class PostsController < ApplicationController
		# 200 => GET
		# 201 => POST
		before_action :authenticate_api_user!
		
		def index

			@posts = Post.all
			render json: @posts, status: 200

		end


		def create

			@post = Post.new(params.permit(:title,:text))
			@post.save!
			render json: @post, status: 201
			
		end

		
		def show

			@post = Post.find(params[:id])
			render json: @post, status: 200

		end



		def update
		
			@post = Post.find(params[:id])
			if @post.update(post_params)
        		render json: @post, status: :ok
      		else
    	    	render json: @post.errors, status: :unprocessable_entity 
	      	end
	    
	    end

		

    	def destroy

    		@post = Post.find_by(:id => params[:id])
    		if @post.nil?
    			payload = {
  				error: "Post not available!"
				}
    			render json: payload, status: :unprocessable_entity
#    			render :json => payload, :status => :bad_request
			else
				@post.destroy
    			render status: :ok
			end

    	end



		def post_params
      		params.permit(:title, :text)
    	end


	end

end
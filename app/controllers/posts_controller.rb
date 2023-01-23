class PostsController < ApplicationController

before_action :authorize_request , only: [ :create ]

before_action :set_posts, only: [:show,:update,:destroy]

    def index 
        @posts =  @current_user.posts
        render json: @posts, status: :ok
    end

     # def user_post
     #    # byebug
     #    #  @current_user = current_user.id
     #    if current_user
     #       @post = Post.all 
     #       render json: @post , status: :ok
     #    end

     # end




    #  def other_user_post
# byebug
        # if current_user.id
        #     @post  = current_user.id.posts
        # render json: @post , status: :ok
        # end
    #  end



    def show 
       render json: @post , status: :ok
    end

  
    def create
       # byebug
       
        @post = @current_user.posts.new(post_params)

        if @post.save
            render json: @post,status: :ok
        else
         render json: { data: @post.errors.full_messages, status: "failed"},status: :unprocessable_entity
        end
    end


    def update
        if  @post.update(post_params)
            render json: @post,status: :ok
        else
        render json: { data: @post.errors.full_messages, status: "failed"},status: :unprocessable_entity
        end
    end


    def destroy
        if @post.destroy
            render json: {data: 'company deleted successfully', status: 'success'},status: :ok
        else
            render json: {data: 'something went wrong', status: 'failed'}    
        end
    end

	private

	def set_posts
	    # @post = Post.find(params[:id])
	    @post = @current_user.posts.find(params[:id])

	end

	def post_params
	params.require(:post).permit(:name,:text,:user_id)
	end
 

end


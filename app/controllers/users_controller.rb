class UsersController < ApplicationController

        before_action :authorize_request ,  except: :create

        before_action :find_user, except: %i[create index]
      
        def index
            # byebug
            users = User.all
            # render json: users , each_serializer: UserSerializer
            render json: users, each_serializer:  UserSerializer
        end
    
    
        def show
          
            render json: UserSerializer.new(@user).serializable_hash , status: :ok
        end
    
        def create 
        #    byebug
            @user = User.new(user_params)
            if @user.save
                message = "The user '#{@user.name}' was just added."
                TwilioTextMessenger.new(message).call
                render json: UserSerializer.new(@user).serializable_hash , status: :ok
            else
                render json: { errors: @user.errors.full_messages },
                  status: :unprocessable_entity
            end
    
        end
    
    
        def update
          
            if @user.update(user_params)
                render json: UserSerializer.new(@user).serializable_hash , status: :ok
            else
                render json: {errors: @user.errors.full_messages},  status: 503
            end
        end
    
    
        def destroy
         @user.destroy 
         render json: {message: "user deleted successfully "}  
        end
    

        def follow
            @user  = User.find(params[:id])
            @current_user.followees << @user
            redirect_back(fallback_location: user_path(@user))

        end
    
    private
        def find_user
            byebug
            @user = User.find(params[:id])
         
        end

        
        
        def user_params
                params.permit(
                :name, :username, :email, :password
                )
        end
 
    
end

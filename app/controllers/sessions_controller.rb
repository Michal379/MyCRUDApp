class SessionsController < ApplicationController
    def index
    users = User.all 
    render json: users
    end
  
    def create
      user = User.find_by(email: params[:email])
  
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to root_path, notice: 'Logged in successfully'
      else
        flash.now.alert = 'Invalid email or password'
        render :new
      end
    end

    def update
        user = find_user
        user.update(user_params)
        render json:user
    end
  
    def destroy
      session[:user_id] = nil
      redirect_to root_path, notice: 'Logged out successfully'
    end

    private
    def user_params
        params.permit( :title, :image, :notes)
    end
    
  end
  
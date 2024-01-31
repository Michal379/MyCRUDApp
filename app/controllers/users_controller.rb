# app/controllers/users_controller.rb
class UsersController < ApplicationController
    
    #GET /spices
    def index
        users = User.all
        render json: users
    end

    #POST /spices
    def create
        sUser = User.create(user_params)
        render json: spice, status: :created
    end

    #PATCH /spices/:id
    def update 
       user = find_user
       user.update(user_params)
        render json:user
    end

    #DELETE /users/:id
    def destroy
        user = find_user
        user.destroy
        head :no_content
    end

    private 
    def find_user
        user.find_by(id: params[:id])
    end

    private
    def user_params
        params.permit( :title, :image, :notes)
    end   

end


  
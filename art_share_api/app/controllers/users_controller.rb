class UsersController < ApplicationController

  def index
    if params[:query]
      render json: User.where("username LIKE ?", "%#{params[:query]}%")
    else
      render json: User.all
    end
  end

  def show
    user = User.find_by(id: params[:id])
    if user
      render json: user
    else
      render json: "Not found!", status: :not_found
    end
  end

  def create 
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    user = User.find_by(id: params[:id])
    if user
      if user.update_attributes(user_params)
        render json: user
      else 
        render json: user.errors.full_messages, status: :unprocessable_entity
      end
    else
      render json: "Not found!", status: :not_found
    end
  end

  def destroy
    user = User.find_by(id: params[:id])
    if user 
      user.destroy
      render json: user
    else 
      render json: "Not found!", status: :not_found
    end
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end

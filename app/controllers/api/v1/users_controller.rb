class Api::V1::UsersController < Api::ApiController
  before_filter :authenticate_user!, only: [:index, :show, :update, :destroy]
  respond_to :json

  def index
    authorize User
    users = User.all
    respond_with users
  end

  def show
    user = User.find(params[:id])
    authorize user
    respond_with user
  end

  def update
    user = User.find(params[:id])
    authorize user
    if !user.update_attributes(update_params)
      return api_error(status: 422, errors: user.errors)
    end
    render json: user, status: 201
  end

  def destroy
    user = User.find(params[:id])
    authorize user
    if !user.destroy
      return api_error(status: 500)
    end
    render json: JSON("User has been removed!"), status: 204
  end

  def create
    render json: JSON("User already exists with this email"), status: 409 if User.find(params[:user][:email])
    user = User.new(create_params)
    return api_error(status: 422, errors: user.errors) unless user.valid?
    user.save!
    render json: user, status: 201
  end

  private

  def create_params
     params.require(:user).permit(:name, :email, :password)
  end

  def update_params
    create_params
  end
end

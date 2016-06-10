class Api::V1::UsersController < Api::ApiController
  before_filter :authenticate_user!, only: [:index, :show, :update, :destroy]
  respond_to :json

  def index
    return render_error unless authorized?
    users = User.all
    respond_with users
  end

  def show
    user = User.find(params[:id])
    return render_error unless authorized?(user)
    respond_with user
  end

  def update
    user = User.find(params[:id])
    return render_error unless authorized?(user)
    if !user.update_attributes(update_params)
      return api_error(status: 422, errors: user.errors)
    end
    render json: user, status: 201
  end

  def destroy
    user = User.find(params[:id])
    return render_error unless authorized?(user)
    unless user.destroy
      return api_error(status: 500)
    end
    render json: JSON('User has been removed!'), status: 204
  end

  def create
    render json: JSON('User already exists with this email'), status: 409 if User.find(params[:user][:email])
    user = User.new(create_params)
    return api_error(status: 422, errors: user.errors) unless user.valid?
    user.save!
    render json: user, status: 201
  end

  private

  def create_params
     params.require(:user).permit(:name, :email, :password, :admin)
  end

  def update_params
    create_params
  end
end

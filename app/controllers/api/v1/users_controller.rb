class Api::V1::UsersController < Api::V1::ApiController
  respond_to :json

  def index
    users = User.all
    respond_with users
  end

  def show
    user = User.find(params[:id])
    #authorize user
    respond_with user
  end

  def update
    user = User.find(params[:id])
    #authorize user
    if !user.update_attributes(update_params)
      return api_error(status: 422, errors: user.errors)
    end
    respond_with user
  end

  def destroy
    user = User.find(params[:id])

    #authorize user

    if !user.destroy
      return api_error(status: 500)
    end

    head status: 204
  end

  def create
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

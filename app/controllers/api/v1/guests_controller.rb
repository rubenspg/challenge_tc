class Api::V1::GuestsController < Api::ApiController
  before_filter :authenticate_user!, only: [:index, :show, :create, :update, :destroy]
  respond_to :json

  def index
    guests = Guest.all
    respond_with guests
  end

  def create
    guest = Guest.new(create_params)
    return api_error(status: 422, errors: guest.errors) unless guest.valid?
    guest.save!
    render json: guest, status: 201
  end

  def show
    guest = Guest.find(params[:id])
    #authorize guest
    respond_with guest
  end

  def update
    guest = Guest.find(params[:id])
    #authorize guest
    if !guest.update_attributes(update_params)
      return api_error(status: 422, errors: guest.errors)
    end
    respond_with guest
  end

  def destroy
    guest = Guest.find(params[:id])

    #authorize guest

    if !guest.destroy
      return api_error(status: 500)
    end

    head status: 204
  end

  private

  def create_params
     params.require(:guest).permit(
       :name, :guest_id
     )
  end

  def update_params
    create_params
  end
end

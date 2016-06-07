class Api::V1::EventsController < Api::V1::ApiController
  #before_filter :authenticate_user!
  respond_to :json

  def index
    events = Event.all
    respond_with events
  end

  def show
    event = Event.find(params[:id])
    #authorize event
    respond_with event
  end

  def update
    event = Event.find(params[:id])
    #authorize event
    if !event.update_attributes(update_params)
      return api_error(status: 422, errors: event.errors)
    end
    respond_with event
  end

  def destroy
    event = Event.find(params[:id])

    #authorize event

    if !event.destroy
      return api_error(status: 500)
    end

    head status: 204
  end

  def create
    event = Event.new(create_params)
    event.user = User.find(params["user_id"])
    return api_error(status: 422, errors: event.errors) unless event.valid?
    event.save!
    render json: event, status: 201
  end

  private

  def create_params
     params.require(:event).permit(
       :name, :date, :user_id
     )
  end

  def update_params
    create_params
  end
end

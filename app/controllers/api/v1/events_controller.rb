class Api::V1::EventsController < Api::ApiController
  before_filter :authenticate_user!, only: [:create, :update, :destroy]
  respond_to :json

  def index
    events = Event.all
    respond_with events
  end

  def show
    event = Event.find(params[:id])
    respond_with event
  end

  def update
    event = Event.find(params[:id])
    user = event.user
    return render_error unless authorized?(user)
    unless event.update_attributes(update_params)
      return api_error(status: 422, errors: event.errors)
    end
    respond_with event
  end

  def destroy
    event = Event.find(params[:id])
    user = event.user
    return render_error unless authorized?(user)

    unless event.destroy
      return api_error(status: 500)
    end

    head status: 204
  end

  def create
    render_error unless requester
    event = Event.new(create_params)
    event.user = requester
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

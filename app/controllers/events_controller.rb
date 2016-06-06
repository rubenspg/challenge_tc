class EventsController < ApplicationController
  def index
    events = Event.all
    render json: events, status: 200
  end

  def show
    event = Event.find(params[:id])
    render json: event, status: :ok
  end

  def new
    event = Event.new({name: "Jogo", date: Time.now})
    event.save!
    render json: event, status: 201
  end
end

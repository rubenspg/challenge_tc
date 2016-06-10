require 'json'

class Api::ApiController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  before_action :destroy_session

  rescue_from ActiveRecord::RecordNotFound, with: :not_found!

  attr_accessor :current_user

  protected

  def render_error
    render json: { error: 'Not authorized. Must be owner or admin.' }, status: 403
  end

  def requester
    User.where('api_key = ?', request.headers['X-Token']).first
  end

  def authorized?(owner = nil)
    return true if requester.admin?
    return false if owner.nil?
    return true if requester.id == owner.id
  end

  def authenticate_user!
    token = request.headers['X-Token']
    invalid_token! unless token
    user = User.where('api_key = ?', token).first
    if user
      @current_user = user
    else
      return unauthenticated!
    end
  end

  def destroy_session
    request.session_options[:skip] = true
  end

  def unauthenticated!
    response.headers['WWW-Authenticate'] = 'Token realm=Application'
    render json: { error: 'Bad credentials' }, status: 401
  end

  def unauthorized!
    render json: { error: 'not authorized' }, status: 403
  end

  def invalid_token!
    render json: { error: 'Missing token or invalid' }, status: 403
  end

  def invalid_resource!(errors = [])
    api_error(status: 422, errors: errors)
  end

  def not_found!
    render json: { error: 'not found' }, status: 404
  end

  def api_error(status: 500, errors: [])
    head status: status && return if errors.empty?

    render json: JSON(errors), status: status
  end
end

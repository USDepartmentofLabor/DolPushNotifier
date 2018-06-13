class ApiController < ApplicationController
  protect_from_forgery with: :null_session

  before_action :authenticate_request
  attr_reader :current_user

  private

  # Authenticate user before any API request is done
  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end
end

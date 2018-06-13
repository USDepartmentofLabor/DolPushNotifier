 class API::V1::AuthenticationController < ApiController
  skip_before_action :authenticate_request

  def authenticate
    command = AuthenticateUser.call(auth_params)

    if command.success?
      render json: { auth_token: command.result }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end

  def auth_params
    params.permit(:email, :password)
  end
 end

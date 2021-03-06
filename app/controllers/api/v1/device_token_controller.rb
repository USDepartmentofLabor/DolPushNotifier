class DeviceTokenController < ApplicationController
  before_action :set_app
  before_action :set_token

  # PATCH/PUT/POST /device_token
  # Assumed to only work with IOS for now
  def create_or_update
    if @device_token && params[:new_token]
      @device_token.update(:token => params[:new_token],:old_token => params[:token] )
      format.json { render json: "Successfully updated token.", status: :success }
    elsif @device_token.create(params{:device_token})
      format.json { render json: "Successfully created new token.", status: :success }
    else
      format.json { render json: @device_token.errors, status: :unprocessable_entity }
    end
  end

  private
  
  # Use callbacks to share common setup or constraints between actions.

  def set_app
    @app = RailsPushNotifications::APNSApp.find(params[:app_id])
    render json: "App ID not specified or invalid", status: :unprocessable_entity unless @app.present?
  end

  def set_token
    @device_token = DeviceToken.find_by_token(params[:token])
  end
  
  # Never trust parameters from the scary internet, only allow the white list through.
  def device_params
    params.require(:device_token).permit(:app_id,:new_token,:token)
  end
end

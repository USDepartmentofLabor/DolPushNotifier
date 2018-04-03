module Api
  module V1
    class PublishNotificationsController < ApplicationController
      before_action :set_app , only: [:create]

      # POST /pubulish_notifications
      # POST /pubulish_notifications.json
      def create
        respond_to do |format|
          notification = @app.notifications.create(
            destinations: @tokens,
            data: { aps: { alert: @message, sound: 'true', badge: 1 } }
          )
          if @app.push_notifications
            format.json { render json: "success" , status: :success }
          else
            format.json { render json: @pubulish_notification.errors, status: :unprocessable_entity }
          end
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_app
          @app = RailsPushNotifications::APNSApp.find(params[:push_notification][:app_id])
          @message = params[:push_notification][:notification_msg]
          @tokens = params[:push_notification][:device_tokens].is_a?(String) ? [params[:push_notification][:device_tokens]] : params[:push_notification][:device_tokens]
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def pubulish_notification_params
          params.require(:push_notification).permit(:app_id, :device_tokens,:notification_msg)
        end
    end
  end
end

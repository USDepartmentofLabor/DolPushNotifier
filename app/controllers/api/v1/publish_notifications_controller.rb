module API
  module V1
    class PublishNotificationsController < ApiController
      before_action :set_app , only: [:create]

      # POST /api/v1/pubulish_notifications
      # POST /api/v1/pubulish_notifications.json
      def create
        respond_to do |format|
          begin
            notification = @app.notifications.create(
              destinations: [@token],
              data: { aps: { alert: @message, sound: 'true', badge: 1 } })
             if @app.push_notifications.first.sent
               format.json { render json: "success" , status: :success }
             else
               format.json { render json: "Unable to send push notifcation.", status: :unprocessable_entity }
             end
          rescue => e
            Rails.logger.error("Unable to send push notification #{e}")
            format.json { render json: "Error while processing push notification.", status: 500 }
          end
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_app
          @app = RailsPushNotifications::APNSApp.find(params[:notification][:appid])
          @message = params[:notification][:msg]
          @token = params[:notification][:token]
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def pubulish_notification_params
          params.require(:notification).permit(:appid, :token,:msg)
        end
    end
  end
end

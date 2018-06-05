class PushappsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
  end

  def create
    case params[:apptype]
    when "apple"
      create_apns_app
    when "android"
      create_gcm_app
    when "windows"
      create_mpns_app
    end
  end

  def show
  end

  private

  def create_apns_app
    @app = RailsPushNotifications::APNSApp.new
    @app.apns_dev_cert = params[:apns_dev_cert]
    @app.apns_prod_cert = params[:apns_prod_cert]
    @app.save
  end

  def create_gcm_app
    @app = RailsPushNotifications::GCMApp.new
    @app.gcm_key = params[:gcm_key]
    @app.save
  end

  def create_mpns_app
    @app = RailsPushNotifications::MPNSApp.new
    @app.cert = params[:mpns_cert]
    @app.save
  end

end

class PushappsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_app, only: [:show, :destroy, :edit, :update]

  def index
    @apps = Pushapp.all
  end

  def new
    @app = Pushapp.new
  end

  def create
    @app = Pushapp.new(apns_params)
    if @app.save
      flash[:notice] = "Successfully created APNS App" 
      redirect_to pushapps_path
    else
      render 'new', alert: "Unable to create APNS App"
    end 
  end

  def show
  end

  def edit
  end

  def update
    if @app.update(apns_params)
      flash[:notice] = "Successfully updated App"
      redirect_to @app
    else
      render 'edit', alert: "Unable to update App"
    end
  end

  def destroy
    if @app.destroy
      redirect_to pushapps_path, :notice => "Pushapp deleted successfully."
    else
      flash[:eroor] = "Unable to delete app"
      redirect_to pushapp_path(@app)
    end
  end

  private

  def apns_params
    params.require(:pushapp).permit(:name, :apns_dev_cert, :apns_prod_cert, :sandbox_mode)
  end

  def set_app
    @app = Pushapp.find(params[:id])
  end
end

class HomeController < ApplicationController
  before_action :authenticate_user!
  before_action :set_home, only: [:show, :edit, :update, :destroy]
  

  # GET /homes
  # GET /homes.json
  def index
    @current_user = current_user
  end

end

class TechbitsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :set_techbit, only: [:show, :edit, :update, :destroy]

  # GET /techbits
  def index
    @techbits = Techbit.order(:created_at => "DESC").page
  end

  # GET /techbits/:id
  def show
  end

  # GET /techbits/new
  def new
    @techbit = Techbit.new
  end

  # POST /techbits
  def create
    @techbit = Techbit.new(techbit_params)
    if @techbit.save
      flash[:notice] = "Successfully created techbit."
      redirect_to @techbit
    else
      render 'new' , :alert => "Unable to create techbit!"
    end
  end

  # GET /techbits/:id/edit
  def edit
  end

  # PUT/PATCH /techbits/:id
  def update
    if @techbit.update(techbit_params)
      flash[:notice] = "Successfully updated techbit."
      redirect_to @techbit
    else
      render 'edit', :alert => "Unable to update techbit!"
    end
  end

  # DELETE /techbits/:id
  def destroy
    redirect_to techbits_path if @techbit.destroy
  end

  private

  # Don't trust the params from the internet. Whitelist all parameters
  def techbit_params
    params.require(:techbit).permit(:title, :description, :url, :active)
  end

  def set_techbit
    @techbit = Techbit.find(params[:id])
  end
end

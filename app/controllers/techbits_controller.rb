class TechbitsController < ApplicationController
  before_action :set_techbit, only: [:show, :edit, :update, :destroy]

  # GET /techbits
  def index 
    @techbits = Techbit.all
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
      redirect_to @techbit
    else
      render 'new'
    end
  end

  # GET /techbits/:id/edit
  def edit
  end

  # PUT/PATCH /techbits/:id
  def update
    if @techbit.update(techbit_params)
      redirect_to @techbit
    else
      render 'edit'
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
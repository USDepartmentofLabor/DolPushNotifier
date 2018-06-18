class Admin::UsersController < ApplicationController
  before_action :set_user, only: [:show, :destroy, :edit, :update]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  # Audit comment working
  def create
    @user = User.new(user_params.merge!(audit_comment: "#{current_user.email} created an account"))
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params.merge!(audit_comment: "#{current_user.email} updated #{@user.email} attribute"))
      redirect_to @user
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    users_email = @user.email
    if @user.id != current_user.id && @user.destroy
      redirect_to users_path
    end
  end

  private
  def current_admin_user
    current_user.email
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :is_admin)
  end
end

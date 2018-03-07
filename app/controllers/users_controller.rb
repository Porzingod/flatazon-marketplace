class UsersController < ApplicationController
  before_action :get_user, only: [:show, :edit, :update]

  def new
    if session[:user_id]
      redirect_to '/dashboard'
    else
      @user = User.new
      @user.addresses.build
    end
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to '/dashboard'
    else
      render :new
    end
  end

  def show
    if @user.nil?
      redirect_to '/'
    else
      render :show
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to '/dashboard'
    else
      render :edit
    end
  end

  def inventory
    get_user
  end

  private

  def get_user
    @user = User.find_by(id: session[:user_id])
  end

  def user_params
    params.require(:user).permit(
      :username,
      :email,
      :password,
      :password_confirmation,
      addresses_attributes: [
        :id,
        :street_address_1,
        :street_address_2,
        :city,
        :state,
        :zipcode,
        :address_type
      ]
    )
  end
end

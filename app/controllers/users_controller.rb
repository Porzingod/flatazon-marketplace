class UsersController < ApplicationController
  before_action :get_user, only: [:show, :edit, :update]

  def new
    @user = User.new
    @user.addresses.build(address_type: 'work')
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user] = @user.id
      redirect_to '/dashboard'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  private

  def get_user
    @user = User.find(session[:user])
  end

  def user_params
    params.require(:user).permit(
      :username,
      :email,
      :password,
      :password_confirmation,
      addresses_attributes: [
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

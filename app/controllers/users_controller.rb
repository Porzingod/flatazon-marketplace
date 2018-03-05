class UsersController < ApplicationController
  def new
    @user = User.new
    @user.addresses.build(address_type: 'work')
  end

  def create
    byebug
  end

  private

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

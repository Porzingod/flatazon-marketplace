class AddressesController < ApplicationController

  def edit
    @address = Address.find(params[:id])
  end

  def update
    # @address
  end

  private

  def address_params
    # params.require(:address).permit()
  end

end

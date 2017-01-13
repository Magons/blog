class IpAddressesController < ApplicationController
  def index
    @ip_addresses = IpAddress.where('array_length(users, 1) > 1')
    render json: @ip_addresses
  end
end

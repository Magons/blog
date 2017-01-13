class IpAddressesController < ApplicationController
  def index
    @ip_addresses = IpAddressService.new.find_duplicated
    render json: @ip_addresses.as_json
  end
end

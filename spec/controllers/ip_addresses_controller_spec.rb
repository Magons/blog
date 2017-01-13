require 'rails_helper'

RSpec.describe IpAddressesController, type: :controller do

  describe 'GET #index' do
    let!(:ip_address) { FactoryGirl.create(:ip_address) }
    let!(:ip_address_2) { FactoryGirl.create(:ip_address_2) }
    let!(:ip_address_3) { FactoryGirl.create(:ip_address_3) }

    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'returns ip addresses which use two or more authors' do
      get :index

      expect(JSON.parse(response.body)).to eq(
        [
          { 'ip' => { 'family' => 2, 'addr' => 2066552581, 'mask_addr' => 4294967295 },
            'users' => ['Sam', 'Kevin'] },
          { 'ip' => { 'family' => 2, 'addr' => 2066552634, 'mask_addr' => 4294967295 },
            'users' => ['Carry', 'Jhon', 'Samanta'] }
        ]
      )
    end
  end

end

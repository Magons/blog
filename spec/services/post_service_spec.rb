require 'rails_helper'

RSpec.describe PostService, :type => :service do
  def subject(params)
    PostService.new(params).create
  end

  describe 'passing valid parameters' do
    let!(:user) { FactoryGirl.create(:user) }
    let!(:ip_address) { FactoryGirl.create(:ip_address) }

    params = ActionController::Parameters.new({
      post: {
        title: 'Test',
        content: 'Test',
        ip_address: '3.45.67.123'
      },
      author: {
        login: 'Jhon'
      }
    })

    it 'creates post' do
      expect { subject(params) }.to change { Post.count }
    end

    it "creates user if it doesn't exist" do
      expect { subject(params) }.to change { User.count }
    end

    it "doesn't create user if it exists" do
      params[:author][:login] = 'Sam'
      expect { subject(params) }.not_to change { User.count }
    end

    it "creates ip address if it doesn't exist" do
      expect { subject(params) }.to change { IpAddress.count }
    end

    it "doesn't create ip address if it exists" do
      params[:post][:ip_address] = '123.45.23.5'
      expect { subject(params) }.not_to change { IpAddress.count }
    end

    it "doesn't add user login to ip address's users if it exist" do
      subject(params)
      uses_logins = IpAddress.last.users
      expect(uses_logins).to eq ['Sam', 'Kevin']
    end

    it "adds user login to ip address's users if it doesn't exist" do
      params[:author][:login] = 'Deric'
      subject(params)
      uses_logins = IpAddress.last.users
      expect(uses_logins).to include('Deric')
    end
  end
end

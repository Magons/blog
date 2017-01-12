require 'rails_helper'

RSpec.describe PostService, :type => :service do
  def subject(params)
    PostService.new(params).create
  end

  describe 'passing valid parameters' do
    let!(:user) { FactoryGirl.create(:user) }

    params = ActionController::Parameters.new({
      post: {
        title: 'Test',
        content: 'Test'
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
  end
end

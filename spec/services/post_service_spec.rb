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

    it 'does not raise error' do
      expect { subject(params) }.not_to raise_error
    end

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

  describe 'passing invalid parameters' do
    params = ActionController::Parameters.new({
      post: {
        title: '',
        content: ''
      },
      author: {
        login: 'Jhon'
      }
    })

    it "raise error 'Title can't blank'" do
      expect { subject(params) }.to raise_error(RuntimeError, "Title can't be blank")
    end

    it "raise error 'Content can't blank'" do
      params[:post][:title] = 'Test'
      expect { subject(params) }.to raise_error(RuntimeError, "Content can't be blank")
    end
  end
end

require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe 'GET index' do
    # it 'assigns @posts' do
    #   team = Team.create
    #   get :index
    #   expect(assigns(:teams)).to eq([team])
    # end

    # it 'renders the index template' do
    #   get :index
    #   expect(response).to render_template('index')
    # end
  end

  describe 'POST create' do
    it 'should be success' do
      post :create, params: { post: { title: 'Test', content: 'test' }, author: { login: 'Sam' } }

      expect(response.content_type).to eq('application/json')
      expect(response).to have_http_status(:success)
    end

    it 'should be unprocessable_entity if params are invalid' do
      post :create, params:{ post: { title: 'Test' }, author: { login: 'Sam' } }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'PUT vote' do
    # it 'assigns @teams' do
    #   team = Team.create
    #   get :index
    #   expect(assigns(:teams)).to eq([team])
    # end

    # it 'renders the index template' do
    #   get :index
    #   expect(response).to render_template('index')
    # end
  end

end

require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe 'GET index' do
    let!(:post) { FactoryGirl.create(:post) }
    let!(:post_2) { FactoryGirl.create(:post_2) }
    let!(:post_3) { FactoryGirl.create(:post_3) }
    let!(:post_4) { FactoryGirl.create(:post_4) }
    let!(:post_5) { FactoryGirl.create(:post_5) }

    it 'should return two records with highest rating' do
      get :index, params: { quantity: 2 }
      expect(assigns(:posts)).to eq([post, post_2])

      expect(response.content_type).to eq('application/json')
      expect(response).to have_http_status(:success)
    end

    it 'should return three records with highest rating' do
      get :index, params: { quantity: 3 }
      expect(assigns(:posts)).to eq([post, post_2, post_3])

      expect(response.content_type).to eq('application/json')
      expect(response).to have_http_status(:success)
    end

    it 'should return array of objects whith title and content' do
      get :index, params: { quantity: 2 }
      expect(JSON.parse(response.body)).to eq(
        [
          { 'title' => 'Title', 'content' => 'Content' },
          { 'title' => 'Title', 'content' => 'Content' }
        ]
      )
    end
  end

  describe 'POST create' do
    it 'should be success' do
      post :create, params: { post: { title: 'Test', content: 'test' }, author: { login: 'Sam' } }

      expect(response.content_type).to eq('application/json')
      expect(response).to have_http_status(:success)
    end

    it 'should be unprocessable_entity if params are invalid' do
      post :create, params: { post: { title: 'Test' }, author: { login: 'Sam' } }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)).to eq('content' => ["can't be blank"])
    end

    it 'should return all attributes of the new post' do
      post :create, params: { post: { title: 'Test', content: 'test' }, author: { login: 'Sam' } }
      expect(JSON.parse(response.body).keys.sort).to eq(
        %w(average_rating content created_at id ip_address title updated_at user_id).sort
      )
    end
  end

  describe 'PUT vote' do
    let!(:post) { FactoryGirl.create(:post) }

    it 'should return average rating' do
      put :vote, params: { id: post.id, vote_value: 3 }

      expect(response.content_type).to eq('application/json')
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)).to eq('average_rating' => '3.0')
    end
  end
end

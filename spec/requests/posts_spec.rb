require 'rails_helper'

RSpec.describe '/posts', type: :request do
  describe 'GET /index' do
    before(:example) do
      get '/users/1/posts'
    end
    it 'renders a successful response' do
      expect(response).to be_successful
    end
    it 'correctly renders the index template' do
      expect(response).to render_template(:index)
    end
    it 'contain the placeholder text' do
      expect(response.body).to include('Here is a list of posts for a given user')
    end
  end

  describe 'GET /show' do
    before(:example) do
      get '/users/1/posts/1'
    end
    it 'renders a successful response' do
      expect(response).to be_successful
    end
    it 'correctly renders the show template' do
      expect(response).to render_template(:show)
    end
    it 'contain the placeholder text' do
      expect(response.body).to include('Here the details of a post: Comments and Likes')
    end
  end
end

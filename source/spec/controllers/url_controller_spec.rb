require 'rails_helper'

describe UrlsController do
  describe 'GET index' do
    it 'responds with a 200 OK' do
      get :index
      expect(response.status).to eq 200
    end

    it 'assigns @urls' do
      url = Url.create
      get :index
      expect(assigns[:urls]).to eq [url]
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'POST create' do
    it 'creates a url entry' do
      expect do
        post :create, url: { long_url: 'https://www.google.com/' }
      end.to change { Url.count }.by 1
    end

    it 'redirects to the index page' do
      post :create, url: { long_url: 'https://www.google.com/' }
      expect(response).to redirect_to urls_path
    end

    it 'sets the click counter to 0' do
      post :create, url: { long_url: 'https://www.google.com/' }
      expect(Url.first.click_count).to eq 0
    end
  end

  describe 'GET show' do
    let(:url) { Url.create(long_url: 'https://www.google.com/', click_count: 0) }

    it 'redirects to the long url' do
      get :show, { id: url.id }
      expect(response).to redirect_to 'https://www.google.com/'
    end

    it 'increases the click_counter' do
      expect do
        get :show, { id: url.id }
      end.to change { url.reload.click_count }.by 1
    end
  end
end

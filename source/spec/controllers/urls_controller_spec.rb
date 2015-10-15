require 'rails_helper'

RSpec.describe UrlsController, type: :controller do
  let(:valid_url_path){ 'cmm' }
  let(:invalid_url_path){ 'somethingweird' }
  let(:urls_path_with_alert){ %r{\/urls\?alert=.*} }
  let(:valid_attributes) do
    { original: 'http://www.covermymeds.com', shortened: "/#{valid_url_path}" }
  end
  let(:valid_session) { {} }

  describe 'GET index' do
    it 'assigns all urls as @urls' do
      url = Url.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:urls)).to eq([url])
    end
  end

  describe 'GET index with error message' do
    it 'assigns all urls as @urls' do
      url = Url.create! valid_attributes
      get :index, { alert: 'some error' }, valid_session
      expect(assigns(:urls)).to eq([url])
      expect(flash.now[:alert]).to be_present
    end
  end

  describe 'GET show' do
    it 'assigns the requested url as @url' do
      url = Url.create! valid_attributes
      get :show, { id: url.to_param }, valid_session
      expect(assigns(:url)).to eq(url)
    end
  end

  describe 'GET short with valid id' do
    it 'redirect to the original url' do
      url = Url.create! valid_attributes
      valid_params =  { id: url.to_param }
      expect(Url)
        .to receive(:build_from_params)
        .with(hash_including(valid_params))
        .and_return(url)
      get :short, valid_params, valid_session
      expect(url.click_count).to eq(1)
    end
  end

  describe 'GET short with valid shortened url' do
    it 'redirect to the original url' do
      url = Url.create! valid_attributes
      valid_params =  { unmatched_route: valid_url_path}
      expect(Url)
        .to receive(:build_from_params)
        .with(hash_including(valid_params))
        .and_return(url)
      get :short, valid_params, valid_session
      expect(url.click_count).to eq(1)
      expect(response).to redirect_to(url.original)
    end
  end

  describe 'GET short with invalid path will redirect to index' do
    it 'redirect to the original url' do
      invalid_params =  { unmatched_route: invalid_url_path}
      expect(Url)
        .to receive(:build_from_params)
        .with(hash_including(invalid_params))
        .and_return(nil)
      get :short, invalid_params, valid_session
      expect(response).to redirect_to(urls_path_with_alert)
    end
  end

  describe 'GET new' do
    it 'assigns a new url as @url' do
      get :new, {}, valid_session
      expect(assigns(:url)).to be_a_new(Url)
    end
  end

  describe 'GET edit' do
    it 'assigns the requested url as @url' do
      url = Url.create! valid_attributes
      get :edit, { id: url.to_param }, valid_session
      expect(assigns(:url)).to eq(url)
    end
  end

  describe 'POST create' do
    describe 'with valid params' do
      it 'creates a new Url' do
        expect do
          post :create, { url: valid_attributes }, valid_session
        end.to change(Url, :count).by(1)
      end

      it 'assigns a newly created url as @url' do
        post :create, { url: valid_attributes }, valid_session
        expect(assigns(:url)).to be_a(Url)
        expect(assigns(:url)).to be_persisted
        expect(Url.find(1).click_count).to eq(0)
      end

      it 'redirects to the created url' do
        post :create, { url: valid_attributes }, valid_session
        expect(response).to redirect_to(Url.last)
      end
    end
  end

  describe 'PUT update' do
    describe 'with valid params' do
      let(:new_value) { 'new value' }
      let(:new_attributes)  do
        { original: new_value, shortened: new_value }
      end

      it 'updates the requested url' do
        url = Url.create! valid_attributes
        put :update, { id: url.to_param, url: new_attributes }, valid_session
        url.reload
        expect(url.shortened).to eq(new_value)
        expect(url.original).to eq(new_value)
      end

      it 'assigns the requested url as @url' do
        url = Url.create! valid_attributes
        put :update, { id: url.to_param, url: valid_attributes }, valid_session
        expect(assigns(:url)).to eq(url)
      end

      it 'redirects to the url' do
        url = Url.create! valid_attributes
        put :update, { id: url.to_param, url: valid_attributes }, valid_session
        expect(response).to redirect_to(url)
      end
    end
  end

  describe 'DELETE destroy' do
    it 'destroys the requested url' do
      url = Url.create! valid_attributes
      expect do
        delete :destroy, { id: url.to_param }, valid_session
      end.to change(Url, :count).by(-1)
    end

    it 'redirects to the urls list' do
      url = Url.create! valid_attributes
      delete :destroy, { id: url.to_param }, valid_session
      expect(response).to redirect_to(urls_url)
    end
  end
end

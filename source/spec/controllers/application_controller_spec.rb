require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  let(:valid_session) { { user_id: 1 } }
  let(:invalid_session) { {} }

  controller do
    def short
      render text: 'Test'
    end
    def index
      render text: 'Test'
    end
  end

  before do
    @routes.draw do
      get 'index' => 'anonymous#index'
      get 'short' => 'anonymous#short'
    end
  end


  it 'redirects if users controller without a valid session' do
    expect(controller)
      .to receive('is_a?')
      .with(UsersController)
      .and_return(true)
    get :index, {}, invalid_session
    expect(response).to redirect_to(new_session_url)
  end

  it 'redirects if not a short url in urls contraller without a valid session' do
    expect(controller)
      .to receive('is_a?')
            .with(UsersController)
            .and_return(false)
    expect(controller)
      .to receive('is_a?')
            .with(UrlsController)
            .and_return(true)
    get :index, {}, invalid_session
    expect(response).to redirect_to(new_session_url)
  end

  it '200 if session controller with invalid session' do
    expect(controller)
    expect(controller)
      .to receive('is_a?')
            .with(UsersController)
            .and_return(false)
    expect(controller)
      .to receive('is_a?')
            .with(UrlsController)
            .and_return(false)
    expect(response.status).to be(200)
    get :index, {}, invalid_session
  end

  it '200 if urls controller with short action' do
    expect(controller)
    expect(controller)
      .to receive('is_a?')
            .with(UsersController)
            .and_return(false)
    expect(controller)
      .to receive('is_a?')
            .with(UrlsController)
            .and_return(true)
    expect(response.status).to be(200)
    get :short, {id: '1'}, invalid_session
  end

  it '200 if controller with valid session' do
    get :index, {}, valid_session
    expect(response.status).to be(200)
  end
end

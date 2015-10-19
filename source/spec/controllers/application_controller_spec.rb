require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  let(:valid_session) { { user_id: 1 } }
  let(:invalid_session) { {} }

  controller do
    def index
      render text: 'Test'
    end
  end

  it 'redirects if non session controller without a valid session' do
    expect(controller)
      .to receive('is_a?')
      .with(SessionsController)
      .and_return(false)
    get :index, {}, invalid_session
    expect(response).to redirect_to(new_session_url)
  end

  it '200 if session controller with invalid session' do
    expect(controller)
      .to receive('is_a?')
      .with(SessionsController)
      .and_return(true)
    expect(response.status).to be(200)
    get :index, {}, invalid_session
  end

  it '200 if controller with valid session' do
    get :index, {}, valid_session
    expect(response.status).to be(200)
  end
end

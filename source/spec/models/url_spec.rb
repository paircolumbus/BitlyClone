require 'rails_helper'

RSpec.describe Url, type: :model do
  VALID_URL_PATH = 'cmm'
  INVALID_URL_PATH = 'somethingweird'
  let(:valid_attributes) do
    { original: 'http://www.covermymeds.com', shortened: "/#{VALID_URL_PATH}" }
  end

  describe 'build_from_params' do
    it 'finds an instance by id' do
      url = Url.create! valid_attributes
      expect(Url.build_from_params(id: url.id))
        .to eq(url)
    end

    it 'finds an instance by shortened attribute' do
      url = Url.create! valid_attributes
      expect(Url.build_from_params(unmatched_route: VALID_URL_PATH))
        .to eq(url)
    end

    it 'retuns null when nothing is found' do
      expect(Url.build_from_params(unmatched_route: INVALID_URL_PATH))
        .to eq(nil)
    end
  end
end

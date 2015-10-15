require 'rails_helper'

RSpec.describe Url, type: :model do
  let(:valid_url_path){ 'cmm' }
  let(:invalid_url_path){ 'somethingweird' }
  let(:valid_attributes) do
    { original: 'http://www.covermymeds.com', shortened: "/#{valid_url_path}" }
  end

  describe 'build_from_params' do
    it 'finds an instance by id' do
      url = Url.create! valid_attributes
      expect(Url.build_from_params(id: url.id))
        .to eq(url)
    end

    it 'finds an instance by shortened attribute' do
      url = Url.create! valid_attributes
      expect(Url.build_from_params(unmatched_route: valid_url_path))
        .to eq(url)
    end

    it 'retuns null when nothing is found' do
      expect(Url.build_from_params(unmatched_route: invalid_url_path))
        .to eq(nil)
    end
  end
end

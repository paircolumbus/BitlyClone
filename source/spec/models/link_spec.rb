require 'rails_helper'

RSpec.describe Link, type: :model do
  describe '.random_end' do
    let(:link) { FactoryGirl.create :link }

    it  'returns random string' do
      expect(link.random_end.class).to eq(String)
    end

    it 'is 5 characters long'  do
      expect(link.random_end.length).to eq(5)
    end
  end

  context 'on creation' do
    let(:link) { FactoryGirl.build :link }

    it 'automatically creates a new link' do
      link.save
      expect(link.new_url).to_not eq(nil)
    end

    # it 'returns any number, never nil' do
    #   expect(link.counter).to_not eq(nil)
    # end
  end
end

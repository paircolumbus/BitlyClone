require 'rails_helper'
require_relative '../../app/models/url'
require_relative '../../app/helpers/urls_helper'

RSpec.describe Url, type: :model do
  let(:target) { 'http://anomaly.org/wade/projects/index.html' }
  let(:url) { Url.new(target_link: target) }

  it 'has a defined interface' do
    expect(url).to respond_to :ensure_short_link
    expect(url).to respond_to :target_link_not_empty
    expect(url).to respond_to :target_link_must_be_http
    expect(url).to respond_to :target_link_must_be_reachable
  end
end

describe '#ensure_short_link', type: :model do
  let(:target) { 'http://anomaly.org/wade/projects/index.html' }
  let(:linkid) { UrlsHelper.shortened_linkid(target) }

  context 'No linkid already set' do
    let(:url) { Url.new(target_link: target) }

    it 'uses ensure_short_link to generate linkid' do
      expect(url.linkid).to be_nil
      url.ensure_short_link
      expect(url.linkid).not_to be_empty
      expect(url.linkid).to eq linkid
    end
  end

  context 'Linkid is empty' do
    let(:url) { Url.new(target_link: target, linkid: '') }

    it 'uses ensure_short_link to generate linkid' do
      expect(url.linkid).to be_empty
      url.ensure_short_link
      expect(url.linkid).not_to be_empty
      expect(url.linkid).to eq linkid
    end
  end

  context 'Linkid is not reset' do
    let(:url) { Url.new(target_link: target, linkid: 'deadbeef') }

    it 'uses ensure_short_link to generate linkid' do
      url.ensure_short_link
      expect(url.linkid).to eq 'deadbeef'
    end
  end
end

describe 'target_link_validation', type: :model do
  context 'not #valid?' do
    it 'detects missing target' do
      expect(Url.new(target_link: '')).not_to be_valid
    end
    it 'detects missing scheme' do
      expect(Url.new(target_link: 'asdfghfdsafg')).not_to be_valid
    end
    it 'detects wrong scheme' do
      expect(Url.new(target_link: 'ftp://example.com/')).not_to be_valid
    end
    it 'detects unroutable address' do
      expect(Url.new(target_link: 'http://a.a.a.a.a.a.a.a.a/')).not_to be_valid
    end
    it 'detects unroutable address' do
      missing = 'http://localhost/this_page_does_not_exist'
      expect(Url.new(target_link: missing)).not_to be_valid
    end
  end

  context '#valid?' do
    it 'recognizes http request' do
      expect(Url.new(target_link: 'http://google.com/')).to be_valid
    end
    it 'recognizes https request' do
      expect(Url.new(target_link: 'https://google.com/')).to be_valid
    end
  end
end

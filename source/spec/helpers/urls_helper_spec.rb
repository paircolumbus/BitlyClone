require_relative '../../app/helpers/urls_helper'

describe 'UrlsHelper' do
  let(:target) { 'http://covermymeds.com/' }
  let(:linkid) { UrlsHelper.shortened_linkid(target) }

  it 'returns a proper length linkid' do
    expect(linkid.length).to eq UrlsHelper::LINKID_LENGTH
  end

  it 'linkid only contains legal characters' do
    expect(linkid).to match(/^[-_a-zA-Z0-9]{8}$/)
  end

  it 'linkid length can\'t change with changing schema' do
    expect(UrlsHelper::LINKID_LENGTH).to eq 8
  end
end

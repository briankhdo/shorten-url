require 'rails_helper'

describe 'Url' do
  context 'with a valid source' do
    let(:url) { Url.create!(source: 'https://google.com.vn') }
    it 'saves and creates a shorten key' do
      expect(url).to an_instance_of(Url)
      expect(url.id).to be_truthy
      expect(url.key).to be_truthy
      expect(url.key.length).to eq(7)
      expect(url.key).to eq(NumberToBase62.from(url.id))
    end
  end

  context 'with invalid source' do
    let(:url) { Url.new(source: 'hello') }
    it "won't save" do
      expect(url.save!).to raise_error(ActiveRecord::ActiveRecordError)
    end
  end
end

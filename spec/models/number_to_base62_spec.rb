require 'rails_helper'

describe 'NumberToBase62' do
  context 'when converting from number to string' do
    it 'succeeds with 10' do
      expect(NumberToBase62.from(10)).to eq('3336OSO')
    end

    it 'succeeds with 11' do
      expect(NumberToBase62.from(11)).to eq('3336OSJ')
    end
  end

  context 'when converting from string to number' do
    it 'succeeds with 10' do
      expect(NumberToBase62.to('3336OSO')).to eq(10)
    end

    it 'succeeds with 11' do
      expect(NumberToBase62.to('3336OSJ')).to eq(11)
    end
  end
end

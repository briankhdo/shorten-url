require 'rails_helper'

feature 'Home page' do
  let(:url) { Url.create!(source: 'https://google.com.vn') }

  scenario 'has welcome text' do
    visit('/')
    expect(page).to have_content('URL Shortener')
  end

  scenario 'has shorten link table' do
    visit('/')
    expect(page).to have_content('History')
  end

  scenario 'has maximum 20 links displayed' do
    visit('/')
    expect(page).to have_selector('tr', maximum: 20)
  end

  scenario 'with short link' do
    old_clicks_count = url.clicks_count.to_i
    visit("/#{url.key}")
    expect(page.current_url).to start_with(url.source)
    url.reload
    expect(url.clicks_count).to eq(old_clicks_count + 1)
  end
end

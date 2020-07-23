require 'rails_helper'

RSpec.describe UrlsController, type: :routing do
  describe 'routing' do
    it 'routes to #create' do
      expect(post: '/urls').to route_to('urls#create')
    end

    it 'routes to #redirect' do
      expect(get: '/somepath').to route_to('home#redirect', key: 'somepath')
    end
  end
end

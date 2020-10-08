require 'rails_helper'

RSpec.describe 'StaticPagesController', type: :routing do
  describe 'routing' do
    it 'routes to #home' do
      expect(get: "/static_pages/home").to route_to("static_pages#home")
    end
  end
end

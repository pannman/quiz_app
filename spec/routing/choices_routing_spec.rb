require 'rails_helper'

RSpec.describe 'ChoicesController', type: :routing do
  describe 'routing' do
    it 'routes to #new' do
      expect(get: "/choices/new").to route_to("choices#new")
    end
  end
end

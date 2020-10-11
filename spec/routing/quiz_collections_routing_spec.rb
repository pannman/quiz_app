require 'rails_helper'

RSpec.describe 'QuizCollectionsController', type: :routing do
  describe 'routing' do
    it 'routes to #new' do
      expect(get: "/quiz_collections/new").to route_to("quiz_collections#new")
    end
    it 'routes to #index' do
      expect(get: "/quiz_collections/index").to route_to("quiz_collections#index")
    end
  end
end

require 'rails_helper'

RSpec.describe 'QuizzesController', type: :routing do
  describe 'routing' do
    it 'routes to #new' do
      expect(get: "/quizzes/new").to route_to("quizzes#new")
    end
  end
end

require 'rails_helper'

RSpec.describe UsersController, type: %i[request controllers] do

  describe 'GET /users/1' do
    it 'returns a message ' do
      get('/users/1')
      json = JSON.parse(response.body)
      expect(json['status']).to eql('ok')
    end
  end
end
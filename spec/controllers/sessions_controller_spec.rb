require 'rails_helper'

describe SessionsController, type: :controller do
  describe 'POST #create' do

    before(:each) do
      @fingerprint = Faker::Number.number(10)
    end

    subject { post :create, { fingerprint: @fingerprint }.to_json, { accept: 'application/json' } }

    it 'creates a new user' do
      expect{subject}.to change{User.count}.by(1)
    end

    it 'returns a user' do
      subject
      response_json = JSON.parse(response.body, symbolize_names: true)

      expect(User.find(response_json[:id])).to_not eq(nil)
    end

  end
end
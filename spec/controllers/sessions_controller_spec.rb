require 'rails_helper'

describe SessionsController, type: :controller do
  describe 'POST #create' do
    before(:each) do
      request.headers['Accept'] = 'application/json'
    end
    context 'good request' do

      before(:each) do
        @fingerprint = Faker::Number.number(10)
      end

      subject { post :create, {fingerprint: @fingerprint}, format: :json }

      it 'creates a new user' do
        expect { subject }.to change { User.count }.by(1)
      end

      it 'returns a user' do
        subject
        response_json = JSON.parse(response.body, symbolize_names: true)

        expect(User.find(response_json[:id])).to_not be_nil
      end

      it 'returns status 201' do
        subject
        expect(response).to have_http_status('201')
      end

      it 'has an api token' do
        subject
        response_json = JSON.parse(response.body, symbolize_names: true)

        expect(response_json[:api_token]).to_not be_nil
      end

    end

    context 'bad request' do

      before(:each) do
        @fingerprint = ''
      end

      subject { post :create, {fingerprint: @fingerprint}, format: :json }

      it 'does not create a new user' do
        expect { subject }.to change { User.count }.by(0)
      end

      it 'returns an error' do
        subject
        response_json = JSON.parse(response.body, symbolize_names: true)

        expect(response_json[:errors]).to_not be_nil
      end

      it 'returns status 422' do
        subject
        expect(response).to have_http_status('422')
      end

    end

  end
end
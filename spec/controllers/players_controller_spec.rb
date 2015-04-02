require 'rails_helper'

RSpec.describe PlayersController, type: :controller do

  describe 'POST #create' do

    context 'good request' do
      before(:each) do
        @gamertag = Faker::Internet.user_name
        @console = FactoryGirl.create(:console)
        @region = FactoryGirl.create(:region)
        @user = FactoryGirl.create(:user)
        @user.generate_api_token
        @game = FactoryGirl.create(:game)
        @mic = rand(2) % 2 == 1
        FactoryGirl.create(:game_console, console_id: @console.id, game_id: @game.id)
        controller.request.env['HTTP_AUTHORIZATION'] = "Token token=#{@user.api_token}"
      end

      subject { post :create,
                     {player: {gamertag: @gamertag, console_id: @console.id, region_id: @region.id, user_id: @user.id, game_id: @game.id, mic: @mic}},
                     format: :json }

      it 'creates a new player' do
        expect { subject }.to change { Player.count }.by 1
      end

      it 'returns a created status' do
        subject

        expect(response).to have_http_status(201)
      end

      it 'returns a player' do
        subject
        response_json = JSON.parse(response.body, symbolize_names: true)
        expect(Player.find(response_json[:id])).to_not be_nil
      end

      it 'player belongs to the user' do
        subject
        response_json = JSON.parse(response.body, symbolize_names: true)
        expect(Player.find(response_json[:id]).user).to eq(@user)
      end

      it 'player belongs to the game' do
        subject
        response_json = JSON.parse(response.body, symbolize_names: true)
        expect(Player.find(response_json[:id]).game).to eq(@game)
      end

    end

    context 'bad request' do

      before(:each) do
        @user = FactoryGirl.create(:user)
        @user.generate_api_token
        controller.request.env['HTTP_AUTHORIZATION'] = "Token token=#{@user.api_token}"
      end

      context 'missing attributes' do
        subject { post :create, {player: {}}, format: :json }

        it 'does not create a new player' do
          expect { subject }.to change { Player.count }.by 0
        end

        it 'returns a 422 status' do
          subject
          expect(response).to have_http_status(422)
        end

        it 'returns error' do
          subject
          response_json = JSON.parse(response.body, symbolize_names: true)
          expect(response_json[:errors]).to_not be_nil
        end
      end

      context 'invalid console' do
        before(:each) do
          @gamertag = Faker::Internet.user_name
          @console = FactoryGirl.create(:console)
          @region = FactoryGirl.create(:region)
          @user = FactoryGirl.create(:user)
          @user.generate_api_token
          @game = FactoryGirl.create(:game)
          @mic = rand(2) % 2 == 1
          controller.request.env['HTTP_AUTHORIZATION'] = "Token token=#{@user.api_token}"
        end

        subject { post :create,
                       {player: {gamertag: @gamertag, console_id: @console.id, region_id: @region.id, user_id: @user.id, game_id: @game.id, mic: @mic}},
                       format: :json }

        it 'does not create a new player' do
          expect { subject }.to change { Player.count }.by 0
        end

        it 'returns a 422 status' do
          subject
          expect(response).to have_http_status(422)
        end

        it 'returns error' do
          subject
          response_json = JSON.parse(response.body, symbolize_names: true)
          expect(response_json[:errors]).to_not be_nil
        end

      end

      context 'invalid id' do
        before(:each) do
          @gamertag = Faker::Internet.user_name
          @console = FactoryGirl.create(:console)
          @region = FactoryGirl.create(:region)
          @region_id = @region.id
          @region.destroy
          @user = FactoryGirl.create(:user)
          @user.generate_api_token
          @game = FactoryGirl.create(:game)
          @mic = rand(2) % 2 == 1
          controller.request.env['HTTP_AUTHORIZATION'] = "Token token=#{@user.api_token}"
        end

        subject { post :create,
                       {player: {gamertag: @gamertag, console_id: @console.id, region_id: @region_id, user_id: @user.id, game_id: @game.id, mic: @mic}},
                       format: :json }

        it 'does not create a new player' do
          expect { subject }.to change { Player.count }.by 0
        end

        it 'returns a 422 status' do
          subject
          expect(response).to have_http_status(422)
        end

        it 'returns error' do
          subject
          response_json = JSON.parse(response.body, symbolize_names: true)
          expect(response_json[:errors]).to_not be_nil
        end

      end

      context 'existing user' do
        before(:each) do
          @gamertag = Faker::Internet.user_name
          @console = FactoryGirl.create(:console)
          @region = FactoryGirl.create(:region)
          @user = FactoryGirl.create(:user)
          @user.generate_api_token
          @game = FactoryGirl.create(:game)
          @mic = rand(2) % 2 == 1
          FactoryGirl.create(:game_console, console_id: @console.id, game_id: @game.id)
          Player.create(gamertag: @gamertag, console_id: @console.id, region_id: @region.id, user_id: @user.id, game_id: @game.id, mic: @mic)
          controller.request.env['HTTP_AUTHORIZATION'] = "Token token=#{@user.api_token}"
        end

        subject { post :create,
                       {player: {gamertag: @gamertag, console_id: @console.id, region_id: @region.id, user_id: @user.id, game_id: @game.id, mic: @mic}},
                       format: :json }

        it 'does not create a new player' do
          expect { subject }.to change { Player.count }.by 0
        end

        it 'returns a 422 status' do
          subject
          expect(response).to have_http_status(422)
        end

        it 'returns error' do
          subject
          response_json = JSON.parse(response.body, symbolize_names: true)
          expect(response_json[:errors]).to_not be_nil
        end
      end
    end
  end

end

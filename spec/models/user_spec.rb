require 'rails_helper'

RSpec.describe User, type: :model do

  describe '.generate_api_token' do

    before(:all) do
      25.times do
        user = FactoryGirl.create(:user)
        user.generate_api_token
      end
    end

    before(:each) do
      @user = FactoryGirl.create(:user)
      @user.generate_api_token
    end

    it 'should be unique' do
      expect(User.where(api_token: @user.api_token).count).to eq(1)
    end

    it 'should not be nil' do
      expect(@user.api_token).to_not be_nil
    end

    it 'should create a new token' do
      old_token = @user.api_token
      @user.generate_api_token
      new_token = @user.api_token

      expect(old_token).to_not eq(new_token)
    end

  end

  describe '.update_identifier' do
    before(:each) do
      @user = FactoryGirl.create(:user)
      @fingerprint = Faker::Number.number(10)
      @ip_address = Faker::Internet.ip_v4_address
    end

    it 'should create a new identifier when it doesn\'t already exist' do
      expect{@user.update_identifier(@fingerprint, @ip_address)}.to change{Identifier.count}.by(1)
    end

    it 'should create a new identifier when it already exists' do
      @user.update_identifier(@fingerprint, @ip_address)
      expect{@user.update_identifier(@fingerprint, @ip_address)}.to change{Identifier.count}.by(0)
    end
  end

end

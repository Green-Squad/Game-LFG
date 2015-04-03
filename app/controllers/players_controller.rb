class PlayersController < ApplicationController
  before_action :set_current_user, only: [:create]

  def create
    params[:player][:user_id] = current_user.id

    @player = Player.new(player_params)
    if @param_errors
      status = @param_errors[:status]
      json = @param_errors[:json]
    else
      if @player.save
        whitelist = Option.where(game_id: params[:player][:game_id])
        @player_options = player_options_params(whitelist, params[:player][:options])
        if all_required?
          if all_saved?
            status = 201
            json = @player.full_json
          else
            @player.destroy
            status = 422
            json = {errors: player_option.errors}.to_json
          end
        else
          @player.destroy
          status = 422
          json = {errors: {option: ['Missing one or more required options.']}}.to_json
        end
      else
        status = 422
        json = {errors: @player.errors}.to_json
      end
    end
    render json: json, status: status
  end

  private
  def player_params
    begin
      params.require(:player).permit(:gamertag, :mic, :console_id, :region_id, :game_id, :user_id)
    rescue ActionController::ParameterMissing => exception
      @param_errors = {json: {errors: exception}.to_json, status: 422}
    end
  end

  def player_options_params(whitelist, data)
    good_params = []
    if data
      data.each do |id, value|
        if whitelist.pluck(:id).include? id.to_i
          good_params << {option_id: id, value: value}
        end
      end
    end
    good_params
  end

  def all_required?
    all = true
    required = Option.where(game_id: params[:player][:game_id], required: true)
    player_option_ids = @player_options.map { |player_option| player_option[:option_id] }
    required.each do |required_option|
      all = false unless player_option_ids.include? required_option.id.to_s
    end
    all
  end

  def all_saved?
    all = true
    @player_options.each do |player_option|
      player_option[:player_id] = @player.id
      po = PlayerOption.new(player_option)
      all = false unless po.save
    end
    all
  end

end

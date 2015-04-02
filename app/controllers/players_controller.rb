class PlayersController < ApplicationController
  before_action :set_current_user, only: [:create]
  def create
    params[:player][:user_id] = current_user.id

    player = Player.new(player_params)
    if @param_errors
      status = @param_errors[:status]
      json = @param_errors[:json]
    else
      if player.save
        status = 201
        json = player.to_json
      else
        status = 422
        json = {errors: player.errors}.to_json
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

end

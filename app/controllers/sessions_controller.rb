class SessionsController < ApplicationController

  def create
    fingerprint = params[:fingerprint]
    ip_address = request.remote_ip

    render json: {  }
  end
end
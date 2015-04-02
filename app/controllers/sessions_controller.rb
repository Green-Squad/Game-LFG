class SessionsController < ApplicationController

  def create
    fingerprint = params[:fingerprint].present? ? params[:fingerprint] : nil
    ip_address = request.remote_ip

    if fingerprint
      identifier = Identifier.where(fingerprint: fingerprint, ip_address: ip_address).first

      if user = current_user
        user.update_identifier(fingerprint, ip_address)
      elsif identifier
        user = User.find(identifier.user_id)
      else
        user = User.create
        user.update_identifier(fingerprint, ip_address)
      end
      user.generate_api_token
      status = 201
      json = user.to_json
    else
      status = 422
      json = { errors: ['No fingerprint was sent.'] }
    end

    render json: json, status: status
  end
end
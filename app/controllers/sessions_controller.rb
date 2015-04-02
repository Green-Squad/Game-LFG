class SessionsController < ApplicationController

  def create
    fingerprint = params[:fingerprint].present? ? params[:fingerprint] : nil
    ip_address = request.remote_ip

    if fingerprint
      identifier = Identifier.where(fingerprint: fingerprint, ip_address: ip_address).first

      if user = current_user
        Identifier.create(fingerprint: fingerprint, ip_address: ip_address, user_id: user.id)
      elsif identifier
        user = User.find(identifier.user_id)
      else
        user = User.create
        Identifier.create(fingerprint: fingerprint, ip_address: ip_address, user_id: user.id)
      end

      status = 201
      json = user.to_json
    else
      status = 422
      json = { errors: ['No fingerprint was sent.'] }
    end

    render json: json, status: status
  end
end
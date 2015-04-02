class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable
  has_many :identifiers
  has_many :players

  def generate_api_token
    token = SecureRandom.hex(16)
    self.api_token = token
    save
  end

  def update_identifier(fingerprint, ip_address)
    Identifier.create(fingerprint: fingerprint, ip_address: ip_address, user_id: id)
  end

end

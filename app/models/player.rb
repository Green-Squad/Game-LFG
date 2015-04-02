class Player < ActiveRecord::Base
  belongs_to :console
  belongs_to :game
  belongs_to :region
  belongs_to :user
  has_many :groups
  has_many :player_options

  validates :gamertag, presence: true
  validates :console, presence: true
  validates :game, presence: true
  validates :region, presence: true
  validates :user, presence: true
  validates :user, uniqueness: {scope: :game}
  validate :allowed_console

  private

  def allowed_console
    unless GameConsole.where(game_id: game_id, console_id: console_id).first
      errors.add(:console, 'Invalid console for this game.')
    end
  end

end

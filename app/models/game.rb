class Game < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :finders]

  has_many :players
  has_many :game_consoles
  has_many :consoles, through: :game_consoles
  has_many :options
  has_many :activities

  after_create :fix_slug

  private

  def slug_candidates
    [
        :short_name,
        :name,
        [:name, :id]
    ]
  end

  def fix_slug
    self.slug = nil
    self.save!
  end

end

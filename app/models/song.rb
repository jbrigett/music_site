# Song
class Song < ApplicationRecord
  belongs_to :singer
  dragonfly_accessor :track
  validates :title, presence: true
end

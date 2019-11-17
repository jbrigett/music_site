# Singer
class Singer < ApplicationRecord
  has_many :songs, dependent: :destroy
  dragonfly_accessor :image
  validates :name, presence: true
  validates_property :width, of: :image, in: (0..900)
  validates_uniqueness_of :name
end

# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true

  has_many :artworks,
  foreign_key: :artist_id

  # How many artworks the viewer has viewed
  has_many :artwork_views,
  foreign_key: :viewer_id,
  class_name: :ArtworkShare

  # All the artworks that the viewer has viewed
  has_many :shared_artworks,
  through: :artwork_views, 
  source: :artwork
end

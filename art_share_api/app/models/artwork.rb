# == Schema Information
#
# Table name: artworks
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  image_url  :string           not null
#  artist_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Artwork < ApplicationRecord
  validates :title, :image_url, :artist, presence: true
  validates :image_url, uniqueness: true
  validates :title, uniqueness: { scope: :artist_id }

  belongs_to :artist,
  class_name: :User

  # How many different people have viewed this artwork
  has_many :artwork_shares

  # Users who viewed this artwork
  has_many :shared_viewers,
  through: :artwork_shares,
  source: :viewer

  has_many :comments,
  dependent: :destroy
end

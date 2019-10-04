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
  foreign_key: :artist_id,
  dependent: :destroy

  # How many artworks the viewer has viewed
  has_many :artwork_views,
  foreign_key: :viewer_id,
  class_name: :ArtworkShare,
  dependent: :destroy

  # All the artworks that the viewer has viewed
  has_many :shared_artworks,
  through: :artwork_views, 
  source: :artwork

  has_many :comments,
  foreign_key: :author_id,
  dependent: :destroy

  has_many :likes

  # liked_comments can be implemented with an association like
  # has_many :liked_comments,
  # through: :likes,
  # source: :likeable, 
  # source_type: :'Comment'
  def liked_comments
    likes.where(likeable_type: 'Comment')
  end

  def liked_artworks
    likes.where(likeable_type: 'Artwork')
  end
end

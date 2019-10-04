# == Schema Information
#
# Table name: artwork_shares
#
#  id         :integer          not null, primary key
#  viewer_id  :integer          not null
#  artwork_id :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ArtworkShare < ApplicationRecord
  validates :viewer, :artwork, presence: true
  validates :viewer_id, uniqueness: { scope: :artwork_id }

  belongs_to :viewer,
  class_name: :User

  belongs_to :artwork
end

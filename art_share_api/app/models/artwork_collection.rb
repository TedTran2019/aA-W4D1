# == Schema Information
#
# Table name: artwork_collections
#
#  id            :integer          not null, primary key
#  collection_id :integer          not null
#  artwork_id    :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class ArtworkCollection < ApplicationRecord
  validates :collection, :artwork, presence: true
  validates :artwork_id, uniqueness: { scope: :collection_id }

  belongs_to :collection

  belongs_to :artwork
end

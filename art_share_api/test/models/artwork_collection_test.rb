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

require 'test_helper'

class ArtworkCollectionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

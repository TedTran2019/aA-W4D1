# == Schema Information
#
# Table name: collections
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Collection < ApplicationRecord
  validates :user, :name, presence: true
  validates :name, uniqueness: { scope: :user_id }

  belongs_to :user

  has_many :artwork_collections
end

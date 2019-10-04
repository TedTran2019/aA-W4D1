# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  author_id  :integer          not null
#  artwork_id :integer          not null
#  body       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ApplicationRecord
  validates :author, :artwork, :body, presence: true

  belongs_to :author,
  class_name: :User

  belongs_to :artwork

  has_many :likes, as: :likeable

  has_many :users_who_liked,
  through: :likes,
  source: :user
end

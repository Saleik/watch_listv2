class List < ApplicationRecord
  belongs_to :user
  has_many :movies, through: :bookmarks
  has_many :bookmarks, dependent: :destroy
  accepts_nested_attributes_for :bookmarks, reject_if: ->(attributes) { attributes["comment"].blank? }, allow_destroy: true

  validates :name, presence: true, uniqueness: { scope: :user_id }
end

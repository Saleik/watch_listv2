class List < ApplicationRecord
  belongs_to :user
  has_many :movies, through: :bookmarks
  has_many :bookmarks, dependent: :destroy

  validates :name, presence: true, uniqueness: { scope: :user_id }
end

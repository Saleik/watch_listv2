class Type < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :movie_types

  validates :name, presence: true, uniqueness: { scope: :user_id }
end

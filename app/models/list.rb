class List < ApplicationRecord
  belongs_to :user
  has_many :movies, through: :bookmarks
  has_many :bookmarks, dependent: :destroy
end

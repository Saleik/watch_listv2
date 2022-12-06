class Movie < ApplicationRecord
  has_many :types, through: :movie_types
  has_many :lists, through: :bookmarks
  has_many :bookmarks, dependent: :destroy
  has_many :movie_types, dependent: :destroy

  validates :title, :overview, :poster_url, :rating, :year, presence: true
  validates :rating, numericality: { in: 0..10 }

  scope :get_selected_movies, -> (movies_array){where(id: movies_array)}

end

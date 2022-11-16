class Type < ApplicationRecord
  has_many :movies, through: :movie_types
  has_many :movie_types, dependent: :destroy
end

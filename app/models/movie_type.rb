class MovieType < ApplicationRecord
  belongs_to :type
  belongs_to :movies
end

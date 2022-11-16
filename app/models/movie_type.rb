class MovieType < ApplicationRecord
  belongs_to :type
  belongs_to :movie
end

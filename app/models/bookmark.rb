class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :comment, length: { minimum: 6 }
  # TODO: Check uniqueness rails options
  # validates :movie, uniqueness: { scope: :list_id }
end

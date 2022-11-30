class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  # TODO: Check uniqueness rails options
  # validates :movie, uniqueness: { scope: :list_id }
end

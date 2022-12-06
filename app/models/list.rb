class List < ApplicationRecord
  attribute :movies_array
  belongs_to :user
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks
  has_one_attached :image

  after_commit :store_bookmarks, on: %i[create]

  validates :name, presence: true, uniqueness: { scope: :user_id }
  validates :resume, presence: true, length: { maximum: 150 }

  def store_bookmarks
    movies = Movie.get_selected_movies(movies_array)
    movies.each do |m|
      bookmark = Bookmark.new(
        list: self,
        movie: m
      )
      bookmark.save!
    end
  end
end

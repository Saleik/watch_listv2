class List < ApplicationRecord
  belongs_to :user
  has_many :movies, through: :bookmarks
  has_many :bookmarks, dependent: :destroy
  has_one_attached :image
  accepts_nested_attributes_for :bookmarks, allow_destroy: true

  after_commit :store_bookmarks, on: %i[create]

  validates :name, presence: true, uniqueness: { scope: :user_id }
  validates :resume, presence: true, length: { maximum: 150 }

  def store_bookmarks
    # movie.each do |m|
    #   if m.size.positive?
    #     bookmark = Bookmark.new(
    #       list: self,
    #       movie: m
    #     )
    #     bookmark.save!
    #   end
    # end
  end
end

class RemoveCommentFromBookmarks < ActiveRecord::Migration[7.0]
  def change
    remove_column :bookmarks, :comment, :text
  end
end

class AddCommentorToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :commentor, :string
  end
end

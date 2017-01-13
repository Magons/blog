class AddAverageRatingToPost < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :average_rating, :decimal
  end
end

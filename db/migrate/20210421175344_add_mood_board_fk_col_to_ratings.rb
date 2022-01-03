class AddMoodBoardFkColToRatings < ActiveRecord::Migration[6.1]
  def change
    add_reference :ratings, :mood_board, foreign_key: true
  end
end

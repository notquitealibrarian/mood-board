class AddMoodBoardFkColToComments < ActiveRecord::Migration[6.1]
  def change
    add_reference :comments, :mood_board, foreign_key: true
  end
end

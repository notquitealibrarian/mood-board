class AddMoodBoardFkColToPins < ActiveRecord::Migration[6.1]
  def change
    add_reference :pins, :mood_board, foreign_key: true
  end
end

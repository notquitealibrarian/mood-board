class AddUserFkColToMoodBoards < ActiveRecord::Migration[6.1]
  def change
    add_reference :mood_boards, :user, foreign_key: true
  end
end

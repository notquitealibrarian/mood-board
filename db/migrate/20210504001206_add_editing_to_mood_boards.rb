class AddEditingToMoodBoards < ActiveRecord::Migration[6.1]
  def change
    add_column :mood_boards, :editing, :boolean
  end
end

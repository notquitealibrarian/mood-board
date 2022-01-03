class CreateMoodBoards < ActiveRecord::Migration[6.1]
  def change
    create_table :mood_boards do |t|
      t.string :template
      t.boolean :published
      t.integer :global_rating
      t.boolean :featured
      t.string :title

      t.timestamps
    end
  end
end

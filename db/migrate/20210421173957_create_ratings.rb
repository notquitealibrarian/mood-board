class CreateRatings < ActiveRecord::Migration[6.1]
  def change
    create_table :ratings do |t|
      t.boolean :like

      t.timestamps
    end
  end
end

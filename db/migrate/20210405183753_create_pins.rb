class CreatePins < ActiveRecord::Migration[6.1]
  def change
    create_table :pins do |t|
      t.string :pin_name
      t.string :hovertext

      t.timestamps
    end
  end
end

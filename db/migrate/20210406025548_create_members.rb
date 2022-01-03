class CreateMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :members do |t|
      t.string :username
      t.string :email
      t.string :about_me

      t.timestamps
    end
  end
end

class CreateIdeas < ActiveRecord::Migration[7.2]
  def change
    create_table :ideas do |t|
      t.string :name
      t.text :description
      t.string :picture

      t.timestamps
    end
  end
end

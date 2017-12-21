class CreateCharacters < ActiveRecord::Migration[5.1]
  def change
    create_table :characters do |t|
      t.string :name
      t.integer :age
      t.integer :sex
      t.text :race
      t.text :memo

      t.timestamps
    end
  end
end

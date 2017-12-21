class CreateBoardMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :board_messages do |t|
      t.text :content
      t.integer :character_id
      t.integer :board_id
      t.text :board_title

      t.timestamps
    end
  end
end

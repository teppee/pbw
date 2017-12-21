class CreateInfos < ActiveRecord::Migration[5.1]
  def change
    create_table :infos do |t|
      t.text :message

      t.timestamps
    end
  end
end

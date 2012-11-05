class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :content
      t.references :item

      t.timestamps
    end
    add_index :notes, :item_id
  end
end

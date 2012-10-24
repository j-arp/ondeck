class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.text :description
      t.integer :effort_level
      t.string :bcid
      t.references :status
      t.references :program

      t.timestamps
    end
    add_index :items, :status_id
    add_index :items, :program_id
  end
end

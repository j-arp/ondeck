class AddDueDateToItem < ActiveRecord::Migration
  def change
    add_column :items, :due_date, :date
  end
end

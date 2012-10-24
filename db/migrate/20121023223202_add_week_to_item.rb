class AddWeekToItem < ActiveRecord::Migration
  def change
    add_column :items, :week, :integer
  end
end

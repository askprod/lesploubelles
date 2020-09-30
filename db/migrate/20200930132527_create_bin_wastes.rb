class CreateBinWastes < ActiveRecord::Migration[5.2]
  def change
    create_table :bin_wastes do |t|
      t.integer :day
      t.belongs_to :street
      t.timestamps
    end
  end
end

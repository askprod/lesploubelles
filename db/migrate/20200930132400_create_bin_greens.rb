class CreateBinGreens < ActiveRecord::Migration[5.2]
  def change
    create_table :bin_greens do |t|
      t.text :days, array: true, default: []
      t.belongs_to :street
      t.timestamps
    end
  end
end

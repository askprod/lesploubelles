class CreateBinBrocantes < ActiveRecord::Migration[5.2]
  def change
    create_table :bin_brocantes do |t|
      t.string :day_of_week
      t.integer :weeks_to_skip
      t.belongs_to :sector
      t.timestamps
    end
  end
end

class CreateSectors < ActiveRecord::Migration[5.2]
  def change
    create_table :sectors do |t|
      t.integer :number
      t.belongs_to :city
      t.timestamps
    end
  end
end

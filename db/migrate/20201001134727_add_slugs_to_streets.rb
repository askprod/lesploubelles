class AddSlugsToStreets < ActiveRecord::Migration[5.2]
  def change
    add_column :streets, :slug, :string
    add_index :streets, :slug, unique: true
  end
end

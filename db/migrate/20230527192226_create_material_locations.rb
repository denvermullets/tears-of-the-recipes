class CreateMaterialLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :material_locations do |t|
      t.belongs_to :material, foreign_key: 'material_id', null: false
      t.belongs_to :location, foreign_key: 'location_id', null: false

      t.timestamps
    end
  end
end

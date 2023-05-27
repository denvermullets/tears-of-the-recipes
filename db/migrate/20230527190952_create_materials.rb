class CreateMaterials < ActiveRecord::Migration[7.0]
  def change
    create_table :materials do |t|
      t.integer :compendium_id
      t.string :name
      t.string :description
      t.string :image_url
      t.string :type

      t.timestamps
    end
  end
end

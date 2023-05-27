class CreateMaterialRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :material_recipes do |t|
      t.belongs_to :material, foreign_key: 'material_id', null: false
      t.belongs_to :recipe, foreign_key: 'recipe_id', null: false

      t.timestamps
    end
  end
end

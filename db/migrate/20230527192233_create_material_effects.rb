class CreateMaterialEffects < ActiveRecord::Migration[7.0]
  def change
    create_table :material_effects do |t|
      t.belongs_to :material, foreign_key: 'material_id', null: false
      t.belongs_to :effect, foreign_key: 'effect_id', null: false

      t.timestamps
    end
  end
end

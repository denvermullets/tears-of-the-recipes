class CreateEffects < ActiveRecord::Migration[7.0]
  def change
    create_table :effects do |t|
      t.string :property

      t.timestamps
    end
  end
end

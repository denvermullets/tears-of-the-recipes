class MaterialEffect < ApplicationRecord
  belongs_to :material
  belongs_to :effect

  def self.find_or_create_material_effect(attributes)
    find_by(attributes) || create(attributes)
  end
end

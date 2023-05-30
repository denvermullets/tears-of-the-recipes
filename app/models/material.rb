class Material < ApplicationRecord
  has_many :material_locations
  has_many :locations, through: :material_locations

  has_many :material_effects
  has_many :effects, through: :material_effects

  has_many :material_recipe
  has_many :recipes, through: :material_recipe

  def self.find_or_create_material(attributes)
    find_by(attributes) || create(attributes)
  end
end

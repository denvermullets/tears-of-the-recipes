class Effect < ApplicationRecord
  has_many :material_effects
  has_many :materials, through: :material_effects

  def self.find_or_create_effect(attributes)
    find_by(attributes) || create(attributes)
  end
end

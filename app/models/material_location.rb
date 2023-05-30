class MaterialLocation < ApplicationRecord
  belongs_to :material
  belongs_to :location

  def self.find_or_create_material_location(attributes)
    find_by(attributes) || create(attributes)
  end
end

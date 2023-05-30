class Location < ApplicationRecord
  has_many :material_locations
  has_many :materials, through: :material_locations

  def self.find_or_create_location(attributes)
    find_by(attributes) || create(attributes)
  end
end

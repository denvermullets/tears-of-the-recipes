class MaterialRecipe < ApplicationRecord
  belongs_to :material
  belongs_to :recipe
end

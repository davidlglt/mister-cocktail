class Dose < ActiveRecord::Base

  validates :description, presence: true
  validates :cocktail_id, presence: true
  validates :ingredient_id, presence: true
  validates_uniqueness_of :cocktail_id, :ingredient_id, :scope => [:ingredient_id]

  belongs_to :cocktail
  belongs_to :ingredient
end

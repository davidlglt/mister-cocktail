class Ingredient < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true
  before_destroy :check_for_cocktails
  has_many :doses, dependent: :destroy
end

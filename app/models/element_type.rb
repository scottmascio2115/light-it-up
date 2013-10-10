class ElementType < ActiveRecord::Base

  validates :name, presence: true

  has_many :elements
  has_many :slides, through: :elements

end

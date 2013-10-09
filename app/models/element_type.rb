class ElementType < ActiveRecord::Base

  has_many :elements
  has_many :slides, through: :elements

end

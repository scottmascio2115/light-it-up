class Slideshow < ActiveRecord::Base

  belongs_to :user
  has_many :slides
  has_many :elements, through: :slides

end

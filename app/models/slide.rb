class Slide < ActiveRecord::Base

  belongs_to :slideshow
  belongs_to :creator, class_name: 'User'
  has_many :elements

end

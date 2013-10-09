class Slide < ActiveRecord::Base

  belongs_to :slideshow
  belongs_to :creator, class_name: 'User'
  mas_many :elements

end

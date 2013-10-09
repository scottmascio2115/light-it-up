class Element < ActiveRecord::Base

  belongs_to :slide
  belongs_to :element_type

end

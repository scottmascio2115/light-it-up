class Element < ActiveRecord::Base

  validates :content, presence: true
  validates :slide_id, presence: true
  validates :element_type_id, presence: true

  belongs_to :slide
  belongs_to :element_type

end

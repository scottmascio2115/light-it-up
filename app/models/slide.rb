class Slide < ActiveRecord::Base

  validates :title, presence: true
  # validates :slideshow_id, presence: true
  validates :creator_id, presence: true
  # validates :sort_order, presence: true

  belongs_to :slideshow
  belongs_to :creator, class_name: 'User'
  has_many :elements

end

class Slideshow < ActiveRecord::Base

  validates :name, presence: true
  validates :user_id, presence: true

  belongs_to :user
  has_many :slides
  has_many :elements, through: :slides

end

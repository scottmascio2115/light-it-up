class User < ActiveRecord::Base

  validates :email, presence: true
  validates :email, uniqueness: true
  validates_format_of :email, :with => /.+@.+\..{2,}/

  validates :password, presence: true
  validates :password, length: { minimum: 8 }

  has_secure_password
  has_many :slideshows
  has_many :slides, through: :slideshows

end

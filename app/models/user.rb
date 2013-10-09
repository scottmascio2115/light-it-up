class User < ActiveRecord::Base

  has_secure_password
  has_many :slideshows
  has_many :slides, through: :slideshows

end

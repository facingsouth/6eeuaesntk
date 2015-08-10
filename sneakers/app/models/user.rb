class User < ActiveRecord::Base

  has_many :shoes

  validates :username, length: { in: 6..20 }

  has_secure_password
  
end

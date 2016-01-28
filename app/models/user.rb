class User < ActiveRecord::Base
  has_many :ideas # just adding methods. How many methods?
  has_secure_password

end 
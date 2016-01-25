class User < ActiveRecord::Base
  has_many :ideas
  validates_presence_of :username, :password
end 
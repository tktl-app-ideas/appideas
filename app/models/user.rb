class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  validates :username, length: { minimum: 3 }
	validates :password, presence: true
  has_many :ideas

end

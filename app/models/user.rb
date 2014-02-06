class User < ActiveRecord::Base
  validates :username, uniqueness: true
  validates :username, length: { minimum: 3 }
	has_many :ideas

end

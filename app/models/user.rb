class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true, length: { minimum: 3 }
  validates :password, presence: true

  has_secure_password
  has_many :ideas

end

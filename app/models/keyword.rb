class Keyword < ActiveRecord::Base
  validates_presence_of :name
  validates :name, uniqueness: true

  has_many :idea_keywords, :dependent => :destroy
  has_many :ideas, through: :idea_keywords
end

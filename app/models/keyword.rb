class Keyword < ActiveRecord::Base
  validates_presence_of :name

  has_many :idea_keywords, :dependent => :destroy
  has_many :ideas, through: :idea_keywords
end

class Keyword < ActiveRecord::Base

  has_many :idea_keywords, :dependent => :destroy
  has_many :ideas, through: :idea_keywords
end

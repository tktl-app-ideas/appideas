class Idea < ActiveRecord::Base
  acts_as_commentable

  acts_as_votable

  has_many :idea_keywords, :dependent => :destroy
  has_many :keywords, through: :idea_keywords

  def hello
    "Hello test"
  end
end

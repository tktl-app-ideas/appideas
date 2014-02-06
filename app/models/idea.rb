class Idea < ActiveRecord::Base
  acts_as_commentable
  acts_as_votable

  validates :name, presence: true
  validates :desc, presence: true

  has_many :idea_keywords, :dependent => :destroy
  has_many :keywords, through: :idea_keywords

end

class Keyword < ActiveRecord::Base

		has_many :idea_keywords
		has_many :ideas, through: :idea_keywords
end

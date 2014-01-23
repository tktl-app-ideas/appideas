class Idea < ActiveRecord::Base

		has_many :idea_keywords, :dependent => :destroy
		has_many :keywords, through: :idea_keywords

		def hello
				"Hello test"
		end
end

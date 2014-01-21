class IdeaKeyword < ActiveRecord::Base
		belongs_to :idea
		belongs_to :keyword
end
